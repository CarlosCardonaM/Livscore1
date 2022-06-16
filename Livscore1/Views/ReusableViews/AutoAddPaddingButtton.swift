//
//  AutoAddPaddingButtton.swift
//  Livscore1
//
//  Created by Carlos Cardona on 15/06/22.
//

import Foundation
import UIKit

class AutoAddPaddingButtton : UIButton {
    override var intrinsicContentSize: CGSize {
        get {
            let baseSize = super.intrinsicContentSize
            return CGSize(width: baseSize.width + 20,//ex: padding 20
                          height: baseSize.height)
        }
    }
}
