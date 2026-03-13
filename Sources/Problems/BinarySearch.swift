//
//  BinarySearch.swift
//  SwiftUniverse
//
//  Created by Cepheus on 09/03/26.
//

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
	var bufferIndex = 0
	let result = binarySearch(nums, target,
							  bufferIndex: &bufferIndex)
	
	return result == -1 ? -1 : bufferIndex + result
}

func binarySearch(_ nums: [Int], _ target: Int, bufferIndex: inout Int) -> Int {
	guard !nums.isEmpty else { return -1 }
	if nums.count == 1 {
		if nums[0] == target { return 0 } else { return -1 }
	}
	
	if nums.last == target { return nums.count-1 }
	if nums.first == target { return 0 }
	if nums[nums.count/2] == target { return nums.count/2 }
	
	let reducedArr: [Int]
	if nums[nums.count/2] > target {
		reducedArr = Array(nums[0..<nums.count/2])
	} else {
		bufferIndex += nums.count/2
		reducedArr = Array(nums[nums.count/2..<nums.count])
	}
	
	return search(reducedArr, target)
}
