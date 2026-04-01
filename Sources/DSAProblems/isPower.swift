//
//  isPower.swift
//  SwiftUniverse
//
//  Created by Cepheus on 07/03/26.
//

import Foundation


func ifPowerOf(of num: Int, input: Int) -> Bool {
	guard input != 1 else { return true }
	guard input%num != 0 else { return false }
	guard input >= num else { return false }
	if input == num || input == 1 {
		return true
	}
	let reduced = input/num
	return ifPowerOf(of: num, input: reduced)
}

