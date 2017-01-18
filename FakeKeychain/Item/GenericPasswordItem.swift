//
//  GenericPasswordItem.swift
//  FakeKeychain
//
//  Created by Zhu Shengqi on 19/01/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import Foundation

public extension Keychain {
    public struct GenericPasswordItem {
        // MARK: - Properties
        public var service: String
        public var account: String
        public var accessGroup: String?
        public var password: String
        
        // MARK: - API Methods
        public static func findItem(forService service: String, account: String, accessGroup: String? = nil) throws -> GenericPasswordItem {
            var query = GenericPasswordItem.emptyQuery
            
            query.set(service as AnyObject?, forItemAttribute: .service)
            query.set(account as AnyObject?, forItemAttribute: .account)
            query.set(accessGroup as AnyObject?, forItemAttribute: .accessGroup)
            
            query.setSearchLimit(.one)
            query.setReturnType(.data)

            var queryResult: AnyObject?
            let resultCode = SecItemCopyMatching(query.dictionary as CFDictionary, &queryResult)
            
            let operationResult = OperationResult(code: resultCode)
            switch operationResult {
            case .success:
                let passwordData = queryResult as! Data
                let password = String(data: passwordData, encoding: .utf8)!
                
                return GenericPasswordItem(service: service, account: account, accessGroup: accessGroup, password: password)
            case .failure(let error):
                throw error
            }
        }
        
        public func save() throws {
            let passwordData = password.data(using: .utf8)!
            
            do {
                // Check if item already exists.
                _ = try GenericPasswordItem.findItem(forService: service, account: account, accessGroup: accessGroup)
            } catch Error.itemNotFound {
                // If not, create a new item
                var query = GenericPasswordItem.emptyQuery
                query.set(service as AnyObject?, forItemAttribute: .service)
                query.set(account as AnyObject?, forItemAttribute: .account)
                query.set(accessGroup as AnyObject?, forItemAttribute: .accessGroup)
                query.data = passwordData
                
                let resultCode = SecItemAdd(query.dictionary as CFDictionary, nil)
                
                let operationResult = OperationResult(code: resultCode)
                switch operationResult {
                case .success:
                    break
                case .failure(let error):
                    throw error
                }
            }
            
            // If item exists, update the item
            var query = GenericPasswordItem.emptyQuery
            query.set(service as AnyObject?, forItemAttribute: .service)
            query.set(account as AnyObject?, forItemAttribute: .account)
            query.set(accessGroup as AnyObject?, forItemAttribute: .accessGroup)
            
            var attributesToUpdate = AttributesToUpdateObject()
            attributesToUpdate.data = passwordData
            
            let resultCode = SecItemUpdate(query.dictionary as CFDictionary, attributesToUpdate.dictionary as CFDictionary)
            
            let operationResult = OperationResult(code: resultCode)
            switch operationResult {
            case .success:
                break
            case .failure(let error):
                throw error
            }
        }
        
        public func delete() throws {
            var query = GenericPasswordItem.emptyQuery
            query.set(service as AnyObject?, forItemAttribute: .service)
            query.set(account as AnyObject?, forItemAttribute: .account)
            query.set(accessGroup as AnyObject?, forItemAttribute: .accessGroup)
            
            let resultCode = SecItemDelete(query.dictionary as CFDictionary)
            
            let operationResult = OperationResult(code: resultCode)
            switch operationResult {
            case .success:
                break
            case .failure(let error):
                throw error
            }
        }
    }
}

extension Keychain.GenericPasswordItem: KeychainItemProtocol {
    static let itemType: Keychain.ItemType = .genericPassword
}
