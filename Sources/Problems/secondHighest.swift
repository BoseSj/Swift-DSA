//
//  secondHighest.swift
//  SwiftUniverse
//
//  Created by Cepheus on 09/03/26.
//

import Foundation

func secondHighest(_ s: String) -> Int {
	let nums = Array(Set(
		s.compactMap { str in
			Int(String(str))
		}
	)).sorted()
	
	return if nums.count < 2 { -1 }
	else {
		nums[nums.count-2]
	}
}
