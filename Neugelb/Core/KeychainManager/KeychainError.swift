//
//  KeychainError.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Security

enum KeychainError: Error {
    case encodingFailed
    case decodingFailed
    case duplicateItem
    case itemNotFound
    case unexpectedStatus(OSStatus)
}
