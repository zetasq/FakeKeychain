//
//  ValueType.swift
//  FakeKeychain
//
//  Created by Zhu Shengqi on 20/01/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import Foundation

extension Keychain {
    enum ValueType: String {
        case data
        case ref
        case persistentRef
    }
}

extension Keychain.ValueType: OriginalConstantReflectable {
    var originalConstantName: String {
        var caseName = rawValue
        
        let first = String(caseName.characters.prefix(1)).capitalized
        let other = String(caseName.characters.dropFirst())
        
        return "kSecValue" + first + other
    }
}

extension Keychain.ValueType: CFStringConvertible {
    func asCFString() -> CFString {
        switch self {
        case .data:
            return kSecValueData
        case .ref:
            return kSecValueRef
        case .persistentRef:
            return kSecValuePersistentRef
        }
    }
}
