//
//  CustomDateFormatter.swift
//  NGFoundation
//
//  Created by Aleksei Sigai on 05.05.26.
//

import Foundation

public struct CustomDateFormatter {
    public static let themoviedb: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter
    }()
    
    public static let longGB: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateStyle = .long
        
        return formatter
    }()
    
    public static let longDE: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.dateStyle = .long
        
        return formatter
    }()
}
