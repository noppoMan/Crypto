//
//  random.swift
//  Crypto
//
//  Created by Yuki Takei on 4/12/16.
//  Copyright © 2016 MikeTOKYO. All rights reserved.
//

import COpenSSL


internal func getRandomBytes(size: UInt) throws -> Data {
    var results = [UInt8](repeating: 0, count: Int(size))
    let r = RAND_pseudo_bytes(&results, Int32(size))
    if(r != 0 && r != 1) {
        throw Error.OpenSSLError(ERR_get_error())
    }
    
    return Data(pointer: UnsafePointer<UInt8>(results), length: results.count)
}