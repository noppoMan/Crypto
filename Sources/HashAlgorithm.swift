//
//  HashAlgorithm.swift
//  Crypto
//
//  Created by Yuki Takei on 8/17/16.
//
//

import CNPOpenSSL

public enum HashAlgorithm {
    case sha512
    case sha256
    case sha1
    case md5
}

extension HashAlgorithm {
    public var value: UnsafePointer<EVP_MD> {
        switch(self) {
        case .sha512:
            return EVP_sha512()
        case .sha256:
            return EVP_sha256()
        case .sha1:
            return EVP_sha1()
        case .md5:
            return EVP_md5()
        }
    }
}
