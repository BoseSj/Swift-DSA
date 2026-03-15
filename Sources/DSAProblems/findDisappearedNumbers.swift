//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 15/03/26.
//



func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
	var counter = Array(repeating: 0, count: nums.count)
	var result = [Int]()
	
	for index in 0..<nums.count {
		let foundItem = nums[index]
		if counter[foundItem-1] != 1 {
			counter[foundItem-1] = 1
		}
	}
	for index in 0..<counter.count {
		if counter[index] == 0 {
			result.append(index+1)
		}
	}
	
	return result
}
