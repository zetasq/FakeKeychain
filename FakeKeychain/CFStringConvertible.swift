//
//  CFStringConvertible.swift
//  FakeKeychain
//
//  Created by Zhu Shengqi on 19/01/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import Foundation

protocol CFStringConvertible {
    func asCFString() -> CFString
}
