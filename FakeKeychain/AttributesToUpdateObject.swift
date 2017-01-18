//
//  AttributesToUpdateObject.swift
//  FakeKeychain
//
//  Created by Zhu Shengqi on 22/01/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import Foundation

extension Keychain {
    struct AttributesToUpdateObject {
        var dictionary: [String: AnyObject]
        
        init() {
            dictionary = [:]
        }
        
        var data: Data? {
            get {
                return dictionary[ValueType.data.asCFString() as String] as? Data
            }
            set {
                dictionary[ValueType.data.asCFString() as String] = newValue as AnyObject?
            }
        }
    }
}
