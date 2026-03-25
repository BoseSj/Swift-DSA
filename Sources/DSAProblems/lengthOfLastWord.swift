//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 13/03/26.
//

import Foundation

public enum StringProblems {
	public static func lengthOfLastWord(_ s: String) -> Int {
		s.trimmingCharacters(in: .whitespaces)
			.split(separator: " ")
			.last?
			.count ?? 0
	}
}
