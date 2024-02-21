//
//  TabBarController.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor(hexString: HexColors.darkGrey.description)
            UITabBar.appearance().standardAppearance = tabBarAppearance

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
        tabBar.tintColor = .white
        
        viewControllers = [createNavController(for: HomeViewController(), title: "Home", image: UIImage(systemName: "house") ?? UIImage()),
                           createNavController(for: FixturesViewController(), title: "Fixtures", image: UIImage(systemName: "calendar.day.timeline.trailing") ?? UIImage()),
                           createNavController(for: StandingsViewController(), title: "Standings", image: UIImage(systemName: "newspaper") ?? UIImage()),
                           createNavController(for: MoreViewController(), title: "More", image: UIImage(systemName: "ellipsis.circle") ?? UIImage())
        
        ]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !UserDefaults.standard.bool(forKey: "LaunchedBefore") {
            let vc = WelcomeViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
        }
    }
    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = rootViewController
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
    
}
