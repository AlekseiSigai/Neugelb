//
//  Font+Custom.swift
//  NeugelbUI
//
//  Created by Aleksei Sigai on 05.05.26.
//

import SwiftUI

public extension Font {
    
    enum Size: CGFloat {
        case pt15 = 15
        case pt17 = 17
        case pt20 = 20
        case pt22 = 22
        case pt28 = 28
    }

    enum FontType {
        case bold
        case italic
        case regular
        
    }

    static func custom(type: FontType, size: Size) -> Font {
        switch type {
        case .bold:
            return Font.system(size: size.rawValue).bold()
        case .italic:
            return Font.system(size: size.rawValue).italic()
        case .regular:
            return Font.system(size: size.rawValue)
        }
    }
}
