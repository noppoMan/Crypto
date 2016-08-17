//
//  hasher.swift
//  Crypto
//
//  Created by Yuki Takei on 4/12/16.
//  Copyright © 2016 MikeTOKYO. All rights reserved.
//

import CNPOpenSSL

func hashDigest(_ md: UnsafePointer<EVP_MD>, _ src: String) throws -> Data {
    var buffer = [UInt8](repeating :0, count: Int(EVP_MAX_MD_SIZE))
    var ctx = EVP_MD_CTX()
    var olen: UInt32 = 0
    let char = src.withCString { $0 }
    
    EVP_MD_CTX_init(&ctx)
    if EVP_DigestInit_ex(&ctx, md, nil) <= 0 {
        throw OpenSSLError.rawError(ERR_get_error())
    }
    
    EVP_DigestUpdate( &ctx, char, src.characters.count)
    
    let r = EVP_DigestFinal_ex( &ctx, &buffer,  &olen)
    if(r != 1) {
        throw OpenSSLError.rawError(ERR_get_error())
    }
    
    EVP_MD_CTX_cleanup(&ctx)
    
    return Data(buffer[0..<Int(olen)])
}
