//
//  Crypto.swift
//  Crypto
//
//  Created by Yuki Takei on 4/12/16.
//  Copyright © 2016 MikeTOKYO. All rights reserved.
//

@_exported import C7

/**
 OpenSSL Based Crypto moudle without Foundation dependencies

 ```swift
 let sha256 = Crypto.Hasher(.SHA256)
 ```
 */
public struct Crypto {
    public enum Hasher {
        case sha512
        case sha256
        case sha1
        case md5

        /**
         - parameter algorithm: The Algorithm that want to use
         */
        public init(_ algorithm: Hasher){
            self = algorithm
        }
    }
}

/**
 Hasher
 */
extension Crypto.Hasher {
    /**
     Encrypt the Source string synchronously

     - parameter src: The Srouce string to encrypt
     - returns:  Encrypted result as Buffer
     */
    public func hashSync(_ src: String) throws -> Data {
        switch(self) {
        case .sha512:
            return try encryptBySha512(src)
        case .sha256:
            return try encryptBySha256(src)
        case .sha1:
            return try encryptBySha1(src)
        case .md5:
            return try encryptByMD5(src)
        }
    }
}

/**
 Random Bytes
 */
extension Crypto {

    /**
     Generates cryptographically strong pseudo-random data synchronously.

     - parameter size: A number indicating the number of bytes to generate.
     */
    public static func randomBytesSync(_ size: UInt) throws -> Data {
        return try getRandomBytes(size)
    }
}
