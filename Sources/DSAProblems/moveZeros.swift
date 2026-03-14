//
//  moveZeros.swift
//  SwiftDSA
//
//  Created by Cepheus on 15/03/26.
//

import Foundation

func moveZeroes(_ nums: inout [Int]) {
	guard !nums.isEmpty else { return }

	var toSwapWith: [Int] = []
	for i in 0..<nums.count {
		let item = nums[i]
		
		if item == 0 {
			toSwapWith.append(i)
		}
		else {
			if !toSwapWith.isEmpty {
				nums[i] = 0
				nums[toSwapWith[0]] = item
				toSwapWith.removeFirst()
				toSwapWith.append(i)
			}
		}
	}
}
