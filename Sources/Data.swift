//
//  Data.swift
//  Crypto
//
//  Created by Yuki Takei on 4/12/16.
//  Copyright © 2016 MikeTOKYO. All rights reserved.
//

#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

protocol ByteType {}
extension UInt8: ByteType {}
extension Int8: ByteType {}

extension Data {
    init<T: ByteType>(pointer: UnsafePointer<T>, length: Int) {
        var bytes: [UInt8] = [UInt8](repeating: 0, count: length)
        memcpy(&bytes, pointer, length)
        self.bytes = bytes
    }
}