//
//  SearchAttribute.swift
//  FakeKeychain
//
//  Created by Zhu Shengqi on 19/01/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import Foundation

extension Keychain {
    enum SearchAttribute: String {
        case policy
        case itemList
        case searchList
        case issuers
        case emailAddressIfPresent
        case subjectContains
        case caseInsensitive
        case trustedOnly
        case validOnDate
        case limit
    }
}

extension Keychain.SearchAttribute: OriginalConstantReflectable {
    var originalConstantName: String {
        var caseName = rawValue
        
        let first = String(caseName.characters.prefix(1)).capitalized
        let other = String(caseName.characters.dropFirst())
        
        return "kSecMatch" + first + other
    }
}

extension Keychain.SearchAttribute: CFStringConvertible {
    func asCFString() -> CFString {
        switch self {
        case .policy:
            return kSecMatchPolicy
        case .itemList:
            return kSecMatchItemList
        case .searchList:
            return kSecMatchSearchList
        case .issuers:
            return kSecMatchIssuers
        case .emailAddressIfPresent:
            return kSecMatchEmailAddressIfPresent
        case .subjectContains:
            return kSecMatchSubjectContains
        case .caseInsensitive:
            return kSecMatchCaseInsensitive
        case .trustedOnly:
            return kSecMatchTrustedOnly
        case .validOnDate:
            return kSecMatchValidOnDate
        case .limit:
            return kSecMatchLimit
        }
    }
}

