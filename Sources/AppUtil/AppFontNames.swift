//
//  AppFontNames.swift
//  AppUtil
//
//  Created by Ravi Seta on 25/05/25.
//

import Foundation

public enum AppFontNames: String, CaseIterable {
    // Use name according to font file name in bundle.
    case poppinsRegular = "Poppins-Regular"
    case poppinsMedium = "Poppins-Medium"
    case poppinsBold = "Poppins-Bold"
    case poppinsSemiBold = "Poppins-SemiBold"
       
    var fontExtension: String {
        switch self {
        case .poppinsRegular, .poppinsBold, .poppinsMedium,.poppinsSemiBold:
            return "ttf"
        }
    }
}

extension AppFontNames {
    var fileName: String {
        return rawValue
    }
    
    var fontName: String {
        switch self {
        case .poppinsRegular, .poppinsMedium, .poppinsBold, .poppinsSemiBold:
            return rawValue
        }
    }
}
