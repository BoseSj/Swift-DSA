//
//  reverse.swift
//  SwiftUniverse
//
//  Created by Cepheus on 08/03/26.
//

import Foundation

func reverse(_ x: Int) -> Int {
	let newNum = abs(x)
	
	guard newNum <= INT32_MAX else { return 0 }
	
	let reversed = String(abs(x))
		.reversed()
	let result = Int(String(reversed)) ?? 0
	
	guard result <= INT32_MAX else { return 0 }
	
	return if x < 0 {
		result * -1
	} else {
		result
	}
}


func reverse(of num: Int) -> Int {
	var num = abs(num)
	guard num <= INT32_MAX else {
		return 0
	}
	
	var result = 0
	repeat {
		result = (result * 10) + (num%10)
		num = num/10
	} while num > 0
	
	guard result <= INT32_MAX else {
		return 0
	}
	
	return if num < 0 { result * -1 } else { result }
}
