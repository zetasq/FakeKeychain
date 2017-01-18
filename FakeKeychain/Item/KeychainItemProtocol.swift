//
//  ItemProtocol.swift
//  FakeKeychain
//
//  Created by Zhu Shengqi on 19/01/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import Foundation

protocol KeychainItemProtocol {
    static var itemType: Keychain.ItemType { get }
}

extension KeychainItemProtocol {
    static var emptyQuery: Keychain.Query {
        var query = Keychain.Query()
        query.setItemType(itemType)
        
        return query
    }
}

extension Keychain {
    enum ItemType {
        case genericPassword
        case internetPassword
        case certificate
        case key
        case identity
    }
}

extension Keychain.ItemType: CFStringConvertible {
    func asCFString() -> CFString {
        switch self {
        case .genericPassword:
            return kSecClassGenericPassword
        case .internetPassword:
            return kSecClassInternetPassword
        case .certificate:
            return kSecClassCertificate
        case .key:
            return kSecClassKey
        case .identity:
            return kSecClassIdentity
        }
    }
}

