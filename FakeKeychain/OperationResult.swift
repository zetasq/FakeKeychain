//
//  Error.swift
//  FakeKeychain
//
//  Created by Zhu Shengqi on 19/01/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import Foundation

extension Keychain {
    enum OperationResult {
        case success
        case failure(error: Keychain.Error)
        
        init(code: OSStatus) {
            switch code {
            case errSecSuccess:
                self = .success
            default:
                self = .failure(error: Keychain.Error(code: code))
            }
        }
    }
    
    enum Error: Swift.Error, CustomStringConvertible {
        // Common Errors
        case unimplemented
        case param
        case allocate
        case notAvailable
        case authFailed
        case duplicateItem
        case itemNotFound
        case interactionNotAllowed
        case decode
        case verifyFailed
      
        case other(code: OSStatus)
        
        init(code: OSStatus) {
            switch code {
            case errSecUnimplemented:
                self = .unimplemented
            case errSecParam:
                self = .param
            case errSecAllocate:
                self = .allocate
            case errSecNotAvailable:
                self = .notAvailable
            case errSecAuthFailed:
                self = .authFailed
            case errSecDuplicateItem:
                self = .duplicateItem
            case errSecItemNotFound:
                self = .itemNotFound
            case errSecInteractionNotAllowed:
                self = .interactionNotAllowed
            case errSecDecode:
                self = .decode
            case errSecVerifyFailed:
                self = .verifyFailed
            default:
                self = .other(code: code)
            }
        }
        
        public var description: String {
            switch self {
            case .unimplemented:
                return "unimplemented"
            case .param:
                return "param"
            case .allocate:
                return "allocate"
            case .notAvailable:
                return "not available"
            case .authFailed:
                return "auth failed"
            case .duplicateItem:
                return "duplicate item"
            case .itemNotFound:
                return "item not found"
            case .interactionNotAllowed:
                return "interaction not allowed"
            case .decode:
                return "decode"
            case .verifyFailed:
                return "verify failed"
            case .other(let code):
                return "code \(code)"
            }
        }
        
        var localizedDescription: String {
            return ErrorString(body: "operation failed, reason: \(description)")
        }
    }
}

extension OSStatus {
    var asKeychainOperationResult: Keychain.OperationResult {
        return Keychain.OperationResult(code: self)
    }
}
