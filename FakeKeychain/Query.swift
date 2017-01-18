//
//  Query.swift
//  FakeKeychain
//
//  Created by Zhu Shengqi on 19/01/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import Foundation

extension Keychain {
    struct Query {
        var dictionary: [String: AnyObject]
        
        init() {
            dictionary = [:]
        }
        
        mutating func setItemType(_ type: ItemType) {
            dictionary[kSecClass as String] = type.asCFString()
        }
        
        // MARK: Configure Item Attributes
        mutating func set(_ value: AnyObject?, forItemAttribute attribute: ItemAttribute) {
            assert(!(value is NSNull), ErrorString(body: "Nil value detected for setting value for \(attribute.originalConstantName) in keychain query"))

            dictionary[attribute.asCFString() as String] = value
        }
        
        // MARK: Configure Search Attributes
        mutating func set(_ value: AnyObject?, forSearchAttribute attribute: SearchAttribute) {
            assert(!(value is NSNull), ErrorString(body: "Nil value detected for setting value for \(attribute.originalConstantName) in keychain query"))
            
            dictionary[attribute.asCFString() as String] = value
        }
        
        // MARK: Configure Return Type
        mutating func setReturnType(_ type: ReturnType) {
            dictionary[type.asCFString() as String] = true as AnyObject?
        }
        
        // MARK: Configure data
        var data: Data? {
            get {
                return dictionary[ValueType.data.asCFString() as String] as? Data
            }
            set {
                dictionary[ValueType.data.asCFString() as String] = newValue as AnyObject?
            }
        }
        
        // MARK: Convenience
        mutating func setSearchLimit(_ limit: SearchAttribute.Limit) {
            set(limit.asCFString(), forSearchAttribute: .limit)
        }
    }
}
