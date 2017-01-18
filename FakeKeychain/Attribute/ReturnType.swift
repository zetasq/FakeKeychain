//
//  ReturnType.swift
//  FakeKeychain
//
//  Created by Zhu Shengqi on 20/01/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import Foundation

extension Keychain {
    enum ReturnType: String {
        case data
        case attributes
        case ref
        case persistentRef
    }
}

extension Keychain.ReturnType: OriginalConstantReflectable {
    var originalConstantName: String {
        var caseName = rawValue
        
        let first = String(caseName.characters.prefix(1)).capitalized
        let other = String(caseName.characters.dropFirst())
        
        return "kSecReturn" + first + other
    }
}

extension Keychain.ReturnType: CFStringConvertible {
    func asCFString() -> CFString {
        switch self {
        case .data:
            return kSecReturnData
        case .attributes:
            return kSecReturnAttributes
        case .ref:
            return kSecReturnRef
        case .persistentRef:
            return kSecReturnPersistentRef
        }
    }
}
