//
//  Stack.swift
//  Calculator
//
//  Created by Nguyễn Đức Tân on 3/1/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import Foundation
struct Stack {
    fileprivate var array: [String] = []
    mutating func push(_ element: String)
    {
        array.append(element)
    }
    mutating func pop() -> String?{
        return array.popLast()
    }
    func  peak() -> String? {
        return array.last
    }
    func count() -> Int {
        return array.count
    }
}
extension Stack: CustomStringConvertible {
    var description: String {
        return array.reversed().joined(separator: ",")
    }
}
