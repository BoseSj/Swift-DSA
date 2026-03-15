//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 15/03/26.
//



func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
	let counter: [Int] = nums.sorted()
	var ledger: [Int: Int] = [:]
	for index in 0..<counter.count {
		if ledger[counter[index]] == nil {
			ledger[counter[index]] = index
		}
	}
	var result = [Int]()
	for num in nums {
		if let value = ledger[num] {
			result.append(value)
		}
		else {
			print("Didn't found \(num)")
		}
	}
	
	return result
}
