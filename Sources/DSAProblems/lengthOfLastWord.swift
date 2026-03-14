//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 13/03/26.
//

import Foundation

func lengthOfLastWord(_ s: String) -> Int {
	s.components(separatedBy: " ")
		.map {
			$0.trimmingCharacters(in: .whitespacesAndNewlines)
		}
		.filter { !$0.isEmpty }
		.last?
		.count ?? 0
}
