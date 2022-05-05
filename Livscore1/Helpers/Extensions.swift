//
//  Extensions.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import UIKit

extension URL {
    
    mutating func addProperty(name: String, value: String?) {
        
        guard var urlComponents = URLComponents(string: absoluteString) else { return }
        
        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ?? []
        
        // Create query item
        let queryItem = URLQueryItem(name: name, value: value)
        
        // Append the new query item in the existing query items array
        queryItems.append(queryItem)
        
        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems
        
        // Return the url with the new components
        self = urlComponents.url!
        
    }
    
}

extension UIViewController {
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}

extension UIView {
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public var left: CGFloat {
        return frame.origin.x
    }
    
    public var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
    
}


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UIFont {
    
    static func scriptFont(size: CGFloat, style: String = "Regular") -> UIFont {
      guard let customFont = UIFont(name: "SourceSansPro-\(style)", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
}

enum fonts {
    case regular
    case light
    case black
}

extension fonts: CustomStringConvertible {
    var description: String {
        switch self {
        case .regular:
            return "Regular"
        case .light:
            return "Light"
        case .black:
            return "Black"
        }
    }
    
}
