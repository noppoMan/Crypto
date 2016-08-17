//
//  CryptoTests.swift
//  Crypto
//
//  Created by Yuki Takei on 4/12/16.
//  Copyright © 2016 MikeTOKYO. All rights reserved.
//

import XCTest
@testable import Crypto

class CryptoTests: XCTestCase {
    static var allTests: [(String, (CryptoTests) -> () throws -> Void)] {
        return [
            ("testHashSync", testHashSync),
            ("testRandomBytesSync", testRandomBytesSync)
        ]
    }

    var context: [[Any]] {
        let md5 = Crypto.Hasher(.md5)
        let sha1 = Crypto.Hasher(.sha1)
        let sha256 = Crypto.Hasher(.sha256)
        let sha512 = Crypto.Hasher(.sha512)
    
        return [
                   [md5, "6556fbe145a1ae3fff09d3ef697f13ea"],
                   [sha1, "d79c69966efe62977628f804bdaa8d0b823e09e7"],
                   [sha256, "d13baa5b91ea95462b1d26b3a3b1874b6be955af5a9630d1d1d0ea9bb981bf0e"],
                   [sha512, "ed0af435aa991c52d5ea94ef2f0883d9227c74f0a4a8956f33f76aac663039e3a0db7481c167edc4dcce9bc38ccb47f28d585e4abdf14d0e1101840570b69779"]
        ]
    }

    func testHashSync(){
        context.forEach {
            let crypto = $0[0] as! Crypto.Hasher
            let expected = $0[1] as! String
            do {
                let buf = try crypto.hashSync("hash value")
                XCTAssertEqual(buf.hexadecimalString(), expected)
            } catch {
                XCTFail("\(error)")
            }
        }
    }

    func testRandomBytesSync(){
        do {
            let buf = try Crypto.randomBytesSync(10)
            XCTAssertEqual(buf.hexadecimalString().characters.count, 20)
        } catch {
            XCTFail("\(error)")
        }
    }
}
