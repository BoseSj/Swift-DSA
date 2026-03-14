//
//  shuffle.swift
//  SwiftDSA
//
//  Created by Cepheus on 15/03/26.
//



func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
	/// Not using swapping cause it seems we need to move all those elements each time
	/// And that'll be just a ton of more operations
	var result = [Int]()
	for index in 0..<n {
		result.append(nums[index])
		result.append(nums[index+n])
	}
	
	return result
}
