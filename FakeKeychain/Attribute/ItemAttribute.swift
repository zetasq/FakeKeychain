//
//  ItemAttribute.swift
//  FakeKeychain
//
//  Created by Zhu Shengqi on 19/01/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import Foundation

extension Keychain {
    enum ItemAttribute: String {
        case accessControl
        case accessible
        case creationDate
        case modificationDate
        case description
        case comment
        case creator
        case `type`
        case label
        case isInvisible
        case isNegative
        case account
        case service
        case generic
        case securityDomain
        case server
        case `protocol`
        case authenticationType
        case port
        case path
        case subject
        case issuer
        case serialNumber
        case subjectKeyID
        case publicKeyHash
        case certificateType
        case certificateEncoding
        case keyClass
        case applicationLabel
        case isPermanent
        case applicationTag
        case keyType
        case keySizeInBits
        case effectiveKeySize
        case canEncrypt
        case canDecrypt
        case canDerive
        case canSign
        case canVerify
        case canWrap
        case canUnwrap
        case accessGroup
        case synchronizable
        case tokenID
    }
}

extension Keychain.ItemAttribute: OriginalConstantReflectable {
    var originalConstantName: String {
        var caseName = rawValue
        
        let first = String(caseName.characters.prefix(1)).capitalized
        let other = String(caseName.characters.dropFirst())
        
        return "kSecAttr" + first + other
    }
}

extension Keychain.ItemAttribute: CFStringConvertible {
    func asCFString() -> CFString {
        switch self {
        case .accessControl:
            return kSecAttrAccessControl
        case .accessible:
            return kSecAttrAccessible
        case .creationDate:
            return kSecAttrCreationDate
        case .modificationDate:
            return kSecAttrModificationDate
        case .description:
            return kSecAttrDescription
        case .comment:
            return kSecAttrComment
        case .creator:
            return kSecAttrCreator
        case .type:
            return kSecAttrType
        case .label:
            return kSecAttrLabel
        case .isInvisible:
            return kSecAttrIsInvisible
        case .isNegative:
            return kSecAttrIsNegative
        case .account:
            return kSecAttrAccount
        case .service:
            return kSecAttrService
        case .generic:
            return kSecAttrGeneric
        case .securityDomain:
            return kSecAttrSecurityDomain
        case .server:
            return kSecAttrServer
        case .protocol:
            return kSecAttrProtocol
        case .authenticationType:
            return kSecAttrAuthenticationType
        case .port:
            return kSecAttrPort
        case .path:
            return kSecAttrPath
        case .subject:
            return kSecAttrSubject
        case .issuer:
            return kSecAttrIssuer
        case .serialNumber:
            return kSecAttrSerialNumber
        case .subjectKeyID:
            return kSecAttrSubjectKeyID
        case .publicKeyHash:
            return kSecAttrPublicKeyHash
        case .certificateType:
            return kSecAttrCertificateType
        case .certificateEncoding:
            return kSecAttrCertificateEncoding
        case .keyClass:
            return kSecAttrKeyClass
        case .applicationLabel:
            return kSecAttrApplicationLabel
        case .isPermanent:
            return kSecAttrIsPermanent
        case .applicationTag:
            return kSecAttrApplicationTag
        case .keyType:
            return kSecAttrKeyType
        case .keySizeInBits:
            return kSecAttrKeySizeInBits
        case .effectiveKeySize:
            return kSecAttrEffectiveKeySize
        case .canEncrypt:
            return kSecAttrCanEncrypt
        case .canDecrypt:
            return kSecAttrCanDecrypt
        case .canDerive:
            return kSecAttrCanDerive
        case .canSign:
            return kSecAttrCanSign
        case .canVerify:
            return kSecAttrCanVerify
        case .canWrap:
            return kSecAttrCanWrap
        case .canUnwrap:
            return kSecAttrCanUnwrap
        case .accessGroup:
            return kSecAttrAccessGroup
        case .synchronizable:
            return kSecAttrSynchronizable
        case .tokenID:
            return kSecAttrTokenID
        }
    }
}
