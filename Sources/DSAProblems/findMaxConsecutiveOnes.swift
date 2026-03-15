//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 15/03/26.
//


func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
	var result = nums.first == 1 ? 1 : 0
	var buffer = 0
	
	for index in 1..<nums.count {
		let item = nums[index]
		let prevItem = nums[index-1]
		
		if item == 1 || (item == 1 && item == prevItem) {
			result += 1
		}
		else {
			if buffer < result {
				buffer = result
			}
			result = 0
		}
	}
	
	return max(buffer, result)
}