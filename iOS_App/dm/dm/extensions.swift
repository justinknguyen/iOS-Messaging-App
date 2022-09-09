//
//  extensions.swift
//  dm
//
//  Created by Justin Nguyen on 2022-05-22.
//

import Foundation

extension Bool {
    var int: Int { self ? 1 : 0 }
}

extension Data {
    var hex: String { map{ String(format: "%02x", $0) }.joined() }
}
