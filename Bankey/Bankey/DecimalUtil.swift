//
//  DecimalUtil.swift
//  Bankey
//
//  Created by Mukhammadali Khayotov on 27/10/22.
//

import Foundation

extension Decimal {
    //converting to double
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
