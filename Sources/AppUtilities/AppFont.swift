//
//  AppFont.swift
//  AppUtil
//
//  Created by Ravi Seta on 25/05/25.
//

import UIKit
import SwiftUI

public struct AppFont {
    
    public static func loadPackageFonts() {
        AppFontNames.allCases.forEach {
            FontLoader.loadFontIfNeeded(for: $0)
        }
    }
  
    public static let largeTitle = UIFont.poppins(ofSize: 40, weight: .regular)
    public static let title1 = UIFont.poppins(ofSize: 32, weight: .bold)
    public static let title2 = UIFont.poppins(ofSize: 22, weight: .bold)
    public static let title3 = UIFont.poppins(ofSize: 20, weight: .bold)
    public static let subHeader = UIFont.poppins(ofSize: 17, weight: .bold)
    public static let subHeader2 = UIFont.poppins(ofSize: 14, weight: .bold)
    public static let description = UIFont.poppins(ofSize: 16, weight: .regular)
    static let popinsMedium = UIFont.poppins(ofSize: 14, weight: .medium)
    static let bodyMedium = UIFont.poppins(ofSize: 17, weight: .semibold)
}

public extension UIFont {
    @available(iOS 13.0, *)
    var ui: Font {
        return Font(self as CTFont)
    }
}
