//
//  WelcomeViewController.swift
//  Livscore1
//
//  Created by Carlos Cardona on 17/06/22.
//

import UIKit
import PaperOnboarding

class WelcomeViewController: UIViewController {
    
    
    // MARK: - views
    private var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.scriptFont(size: 22, style: fonts.black.description)
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        return button
    }()
    
    private let onboarding: PaperOnboarding = {
        let onboarding = PaperOnboarding()
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        return onboarding
    }()

    //MARK: - overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnboarding()
    }
    
    // MARK: Functions
    private func setupOnboarding() {
        
        onboarding.dataSource = self
        onboarding.delegate = self
        
        view.addSubview(onboarding)
        view.addSubview(skipButton)
        
        skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        skipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        onboarding.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        onboarding.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        onboarding.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        onboarding.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        skipButton.addTarget(self, action: #selector(didSkipButton(_:)), for: .touchUpInside)
    }
    
    // MARK: - OBJC Methods
    @objc private func didSkipButton(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "LaunchedBefore")
        self.dismiss(animated: true)
    }
    
}

// MARK: - Paper Onboarding DataSource Methods
extension WelcomeViewController: PaperOnboardingDataSource {

    func onboardingItemsCount() -> Int {
        2
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        
        return [
            OnboardingItemInfo(informationImage: UIImage(named: "applogo3")!,
                               title: "Welcome!",
                               description: "Check scores, standings, fixtures and more",
                               pageIcon: UIImage(named: "circle")!,
                               color: UIColor(hexString: HexColors.darkBackground.description),
                               titleColor: .white,
                               descriptionColor: .gray,
                               titleFont: .scriptFont(size: 26, style: fonts.black.description),
                               descriptionFont: .scriptFont(size: 16, style: fonts.light.description)),
            
            OnboardingItemInfo(informationImage: UIImage(named: "logo")!,
                               title: "YNWA", description: "This app is made by a fan of Liverpool FC",
                               pageIcon: UIImage(named: "circle")!,
                               color: UIColor(hexString: HexColors.darkSecondaryBackgound.description),
                               titleColor: .white,
                               descriptionColor: .gray,
                               titleFont: .scriptFont(size: 26, style: fonts.black.description),
                               descriptionFont: .scriptFont(size: 16, style: fonts.light.description))
        ][index]
        

    }
}

// MARK: - Paper Onboarding Delegate Methods
extension WelcomeViewController: PaperOnboardingDelegate {
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 1 {
            UIView.animate(withDuration: 0.4) {
                self.skipButton.alpha = 1
            }
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index != 1 {
            UIView.animate(withDuration: 0.4) {
                self.skipButton.alpha = 0
            }
        }
    }
    
}
