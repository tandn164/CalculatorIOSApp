//
//  calculate.swift
//  Calculator
//
//  Created by Nguyễn Đức Tân on 3/1/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import Foundation
struct calculate {
    var array : [String] = []
    var stack = Stack()
    init(_ bieuthuc: [String]) {
        array=bieuthuc
    }
    func isOperator(_ x: String) -> Bool {
        if x=="+" || x=="-" || x=="x" || x==":"
        {
            return true
        }
        return false
    }
    func isOperand(_ x: String) -> Bool {
        if x != "+" && x != "-" && x != "x" && x != ":"
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
    mutating func changetoPrefix() -> [String]{
        var prefix : [String] = []
        for i in array
        {
            if isOperand(i)
            {
                prefix.append(i)
            } else
            {
               
                while stack.count()>0 && getPrioity(i) < getPrioity(stack.peak()!)
                {
                    prefix.append(stack.pop()!)
                }
                stack.push(i)
            }
        }
        while stack.count()>0
        {
            prefix.append(stack.pop()!)
        }
        return prefix
    }
    mutating func calculateResult() -> String {
        let bieuthuc = changetoPrefix()
        var a,b: Float
        for i in bieuthuc
        {
            if isOperand(i)
            {
                stack.push(i)
            } else
            {
                if let y = stack.pop() {
                    a = (y as NSString).floatValue
                } else {
                    a = 0
                }
                if let x = stack.pop() {
                    b = (x as NSString).floatValue
                } else
                {
                    b = 0
                }
                switch i {
                case "+":
                    a += b
                case "-":
                    a -= b
                case "x":
                    a *= b
                case ":":
                    a /= b
                default:
                    break
                }
                stack.push(String(format: "%f",a))
            }
        }
        return stack.pop()!
    }
}
