//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 13/03/26.
//

import Foundation

public enum ArrayProblems {

	public static func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
		nums
			.removeAll { item in
				item == val
			}
		return nums.count
	}
}
