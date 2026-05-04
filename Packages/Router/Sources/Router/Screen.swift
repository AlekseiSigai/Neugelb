//
//  Screen.swift
//  Router
//
//  Created by Aleksei Sigai on 04.05.26.
//

import SwiftUI

public struct Screen {
    public let id: String
    public let content: AnyView
    public let presentation: PresentationStyle

    @MainActor
    public init<Content: View>(id: String, content: Content, presentation: PresentationStyle = .regular) {
        self.id = id
        self.content = AnyView(
            content
        )
        self.presentation = presentation
    }
}

extension Screen: Equatable {
    public static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}

extension Screen: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public extension Screen {
    enum PresentationStyle {
        case regular
    }
}
