//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 25/03/26.
//

import Foundation

func evalRPN(_ tokens: [String]) -> Int {
	var evalutationArray: [Int] = []
	for index in 0..<tokens.count {
		let currentItem = tokens[index]
		if let digit = Int(currentItem) {
			evalutationArray.append(digit)
		}
		else {
			if evalutationArray.count >= 2 {
				let y = evalutationArray.popLast()!
				let x = evalutationArray.popLast()!
				
				let value = switch currentItem {
					case "+": x+y
					case "-": x-y
					case "*": x*y
					case "/": x/y
					default: x
				}
				evalutationArray.append(value)
			}
		}
		
	}
	
	return evalutationArray.first ?? 0
}
