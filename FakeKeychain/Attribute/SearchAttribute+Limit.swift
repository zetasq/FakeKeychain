//
//  SearchAttribute+Limit.swift
//  FakeKeychain
//
//  Created by Zhu Shengqi on 19/01/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import Foundation

extension Keychain.SearchAttribute {
    enum Limit: String {
        case one
        case all
    }
}

extension Keychain.SearchAttribute.Limit: OriginalConstantReflectable {
    var originalConstantName: String {
        var caseName = rawValue
        
        let first = String(caseName.characters.prefix(1)).capitalized
        let other = String(caseName.characters.dropFirst())
        
        return "kSecMatchLimit" + first + other
    }
}

extension Keychain.SearchAttribute.Limit: CFStringConvertible {
    func asCFString() -> CFString {
        switch self {
        case .one:
            return kSecMatchLimitOne
        case .all:
            return kSecMatchLimitAll
        }
    }
}
