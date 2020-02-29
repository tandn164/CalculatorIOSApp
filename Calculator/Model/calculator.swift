//
//  calculator.swift
//  Calculator
//
//  Created by Nguyễn Đức Tân on 2/28/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import Foundation
struct caculator{
    var result : Float = 0
    var dau = "+"
    var prebutton = "+"
    mutating func setResult(_ number2: Float)
    {
        switch dau {
        case "+":
            result = result + number2
        case "-":
            result = result - number2
        case "x":
            result = result * number2
        case ":":
            result = result / number2
        default:
            break
        }
    }
    mutating func setPrebutton(_ button: String)
    {
        self.prebutton = button
    }
    mutating func setDau(_ dau: String){
        self.dau = dau
        
    }
    func getResult() -> Float {
        return result
    }
    func getDau() -> String {
        return dau
    }
    func getPrebutton() -> String
    {
        return prebutton
    }
}
