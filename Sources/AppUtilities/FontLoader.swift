//
//  FontLoader.swift
//  AppUtil
//
//  Created by Ravi Seta on 25/05/25.
//

import Foundation
import UIKit

class FontLoader {

    nonisolated(unsafe) private static var loadedFonts: Set<AppFontNames> = .init()
    private static let lock = NSLock()
    
    static func loadFontIfNeeded(for font: AppFontNames, in bundle: Bundle = Bundle.main) {
        lock.lock()
        defer { lock.unlock() }
        
        guard !Self.loadedFonts.contains(font) else {
            /// already loaded no need to do anything
            return
        }
        
        guard UIFont(name: font.fontName, size: 1) == nil else {
            /// already have this font in system so no need to register it
            return
        }
        
        FontLoader.loadedFonts.insert(font)
        
        guard let fontURL = bundle.url(forResource: font.fileName, withExtension: font.fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from filename: \(font.fileName) with extension \(font.fontExtension)")
        }
        
        var error: Unmanaged<CFError>?
        
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDescription = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as Any as! Error
            NSException(
                name: .internalInconsistencyException,
                reason: errorDescription as String?,
                userInfo: [NSUnderlyingErrorKey: nsError as Any]
            ).raise()
        }
    }
}
