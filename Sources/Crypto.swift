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
public struct Crypto {}

/**
 Hasher
 */
extension Crypto {
    public struct Hasher {
        let algorithm: HashAlgorithm
        
        public init(_ algorithm: HashAlgorithm){
            self.algorithm = algorithm
        }
        
        /**
         Encrypt the Source string synchronously
         
         - parameter src: The Srouce string to encrypt
         - returns:  Encrypted result as Buffer
         */
        public func hashSync(_ src: String) throws -> Data {
            return try hashDigest(algorithm.value, src)
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
