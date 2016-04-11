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
        case SHA512
        case SHA256
        case SHA1
        case MD5

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
    public func hashSync(src: String) throws -> Data {
        switch(self) {
        case .SHA512:
            return try encryptBySha512(src)
        case .SHA256:
            return try encryptBySha256(src)
        case .SHA1:
            return try encryptBySha1(src)
        case .MD5:
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
    public static func randomBytesSync(size: UInt) throws -> Data {
        return try getRandomBytes(size)
    }
}
