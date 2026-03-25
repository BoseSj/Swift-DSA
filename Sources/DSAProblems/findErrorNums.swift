//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 15/03/26.
//

import Foundation

func findErrorNums(_ nums: [Int]) -> [Int] {
	var counter = Array(repeating: 0, count: nums.count)
	var result = [Int]()
	
	for index in 0..<nums.count {
		let foundItem = nums[index]
		if counter[foundItem-1] == 1 {
			result.append(foundItem)
		}
		else {
			counter[foundItem-1] = 1
		}
	}
	if let counterIndex = counter.firstIndex(of: 0) {
		result.append(counterIndex+1)
	}
	
	return result
}
