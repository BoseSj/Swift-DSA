//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 29/03/26.
//

import Foundation

extension Character {
	func isCompletionBracket(with bracket: Self) -> Bool {
		(self == "(" && bracket == ")") ||
		(self == "[" && bracket == "]") ||
		(self == "{" && bracket == "}")
	}
	var isClosingBracket: Bool {
		self == ")" ||
		self == "]" ||
		self == "}"
	}
}


func isValidParen(_ brackets: String) -> Bool {
	var parentStack: [Character] = []
	
	for bracket in brackets {
		let currentBracket = bracket
		if !parentStack.isEmpty {
			let lastEntry = parentStack[parentStack.count-1]
			
			if lastEntry.isCompletionBracket(with: currentBracket) {
				_ = parentStack.popLast()
			}
			else if currentBracket.isClosingBracket {
				return false
			}
			else {
				parentStack.append(currentBracket)
			}
		}
		else {
			parentStack.append(currentBracket)
		}
	}
	
	return parentStack.isEmpty
}

