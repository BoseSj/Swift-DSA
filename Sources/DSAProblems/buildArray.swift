//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 17/03/26.
//

import Foundation

func buildArray(_ target: [Int], _ n: Int) -> [String] {
	/// Don't need to create stream array and perform removeFirst
	/// when data is in specific order
	var streamValue = 1
	let popFromStream = {
		streamValue += 1
	}
	
	var result: [String] = []
	for index in 0..<target.count {
		let currentValue = target[index]
		let lessBy = currentValue - streamValue
		
		if lessBy > 0 {
			Array(
				repeating: ["Push", "Pop"],
				count: lessBy
			)
			.forEach { item in
				popFromStream()
				result.append(contentsOf: item)
			}
			popFromStream()
			result.append("Push")
		} else {
			popFromStream()
			result.append("Push")
		}
	}
	
	return result
}
