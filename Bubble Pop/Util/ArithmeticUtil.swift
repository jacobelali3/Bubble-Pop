//
//  ArithmeticUtil.swift
//  Bubble Pop
//
//  Created by Jacob Elali on 28/4/2022.
//

import Foundation

//Assists convert slider into 2 decimal values.
extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
