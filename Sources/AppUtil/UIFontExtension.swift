//
//  UIFont.swift
//  AppUtil
//
//  Created by Ravi Seta on 25/05/25.
//

import UIKit

public extension UIFont {
    
    static func appFont(_ type: AppFontNames, size: CGFloat) -> UIFont? {
        FontLoader.loadFontIfNeeded(for: type)
        return UIFont(name: type.fontName, size: size)
    }
}

public extension UIFont {
    
    enum PoppinsFontType {
        case regular
        case medium
        case bold
        case semibold
    }
    
    static func poppins(
        ofSize size: CGFloat,
        weight: PoppinsFontType
    ) -> UIFont {
        switch weight {
        case .regular:
            return UIFont.appFont(.poppinsRegular, size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
        case .medium:
            return UIFont.appFont(.poppinsMedium, size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
        case .bold:
            return UIFont.appFont(.poppinsBold, size: size)  ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .semibold:
            return UIFont.appFont(.poppinsSemiBold, size: size)  ?? UIFont.systemFont(ofSize: size, weight: .semibold)
        }
    }
}

import SwiftUI

@available(iOS 13.0, *)
public extension Font {
    
    static func poppins(
        ofSize size: CGFloat,
        weight: UIFont.PoppinsFontType
    ) -> Font {
        return Font(UIFont.poppins(ofSize: size,
                                   weight: weight))
    }
}
