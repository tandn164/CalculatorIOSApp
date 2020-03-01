//
//  calculator.swift
//  Calculator
//
//  Created by Nguyễn Đức Tân on 2/28/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import Foundation
struct caculator{
    var bieuthuc: [String] = []
    var predau : String = "+"
    var prenum: String = "0"
    func isOperator(_ x: String) -> Bool {
        if x=="+" || x=="-" || x=="x" || x==":"
        {
            return true
        }
        return false
    }
    func getPrioity(_ x: String) -> Int {
        if x == "x" || x == ":"
        {
            return 2
        }
        return 1
    }
    func isOperand(_ x: String) -> Bool {
        if x != "+" && x != "-" && x != "x" && x != ":"
        {
            return true
        }
        return false
    }
    mutating func addElement(_ element: String){
        bieuthuc.append(element)
    }
    func getPrenum() -> String {
        return prenum
    }
    func getPredau() -> String {
        return predau
    }
    mutating func setPrenum(_ prenum: String) {
        self.prenum = prenum
    }
    mutating func setPredau(_ predau: String) {
        self.predau = predau
    }
    mutating func tinh() -> String{
        var bieuthuc2: [String] = []
        while bieuthuc.count > 0
        {
            bieuthuc2.insert(bieuthuc.last!, at: bieuthuc2.count)
            bieuthuc.remove(at: bieuthuc.count-1)
        }
        var x = calculate(bieuthuc2)
        let result = x.calculateResult()
        bieuthuc.append(result)
        return result
    }
}
