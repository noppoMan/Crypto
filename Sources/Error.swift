//
//  Error.swift
//  Crypto
//
//  Created by Yuki Takei on 4/12/16.
//  Copyright © 2016 MikeTOKYO. All rights reserved.
//

import Foundation

enum Error: ErrorProtocol {
    case OpenSSLError(UInt)
}