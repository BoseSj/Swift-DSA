// The Swift Programming Language
// https://docs.swift.org/swift-book

import DSATopics
import DSAProblems

extension String {
	private var reverseItem: String? {
		switch self {
			case "(": ")"
			case "{": "}"
			case "[": "]"
			default: nil
		}
	}
	func isBracketCompleted(with item: String) -> Bool {
		self.reverseItem == item
	}
}

//		// ["()", "()[]{}", "(]", "([)]", "([])", "[({])}", "[({(())}[()]]"]
//		["[({(())}[()])]"]
//		//		["([])"]
/// 1. Break input in array of items
/// 2. For eachItem in array
/// 	1. While distance from item < length of array
/// 		1. Check item at 2n+1+index
/// 			1. If Match
/// 				1. Omit both items
/// 				2. continue with next
/// 		2. If never matches quit, return nil
func isValidParenthesis(input: String) -> Bool {
	guard input.count%2 == 0 else { return false }
	
	var newArray = input.map { String($0) }
	
	outerLoop: for index in 0..<newArray.count {
		let item = newArray[index]
		if newArray.allSatisfy({ $0.isEmpty }) {
			break
		}
		if item.isEmpty {
			continue outerLoop
		}
		
		var n = 0
		innerLoop: while newArray.count > (index + 2*n + 1) {
			let distance = index + 2*n + 1
			n += 1

			if item.isBracketCompleted(with: newArray[distance]) {
				newArray[distance] = ""
				newArray[index] = ""
				print(distance)
				print(index)
				print(newArray)
				if distance > 1 {
					if isValidParenthesis(input: newArray[index...distance].joined(separator: "")) {
						for i in index...distance {
							newArray[i] = ""
							print(newArray)
						}
						continue outerLoop
					}
					else {
						return false
					}
				}
				else {
					continue outerLoop
				}
			}
		}
		print(newArray)
		return false
	}
	
	return true
}

func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
	var result: [Int] = []
	
	for index in 0..<words.count {
		let currentItem = words[index]
		if currentItem.contains(x) {
			result.append(index)
		}
	}
	
	return result
}

@main
struct SwiftDSA {
	static func main() {
		// Test cases for findWordsContaining
		// Each test is (words, x, expectedIndices)
		let tests: [([String], Character, [Int])] = [
			// Basic cases
			(["apple", "banana", "cherry"], "a", [0, 1]),
			(["dog", "cat", "mouse"], "z", []),
			(["x", "xx", "axx", "b"], "x", [0, 1, 2]),
			// Character appears in multiple positions
			(["alpha", "beta", "gamma", "delta"], "a", [0, 2, 3]),
			// Mixed case sensitivity (Swift's contains is case-sensitive)
			(["Hello", "world", "HELLO"], "H", [0]),
			(["Hello", "world", "HELLO"], "h", []),
			// Empty strings
			(["", "a", "", "b"], "a", [1]),
			// Repeated words
			(["test", "testing", "attest", "contest"], "t", [0, 1, 2, 3]),
			// Non-ASCII characters
			(["café", "naïve", "résumé"], "é", [0, 2])
		]

		var passed = 0
		var failed = 0

		for (i, test) in tests.enumerated() {
			let (words, x, expected) = test
			let got = findWordsContaining(words, x)
			// Because order may be any, compare sorted results
			let ok = got.sorted() == expected.sorted()
			if ok { passed += 1 } else { failed += 1 }
			print("Test #\(i + 1): \(ok ? "PASSED" : "FAILED")")
			print("  words=\(words), x=\(x)")
			print("  expected indices (any order)=\(expected)")
			print("  got                  (any order)=\(got)\n")
		}

		print("Summary: \(passed) passed, \(failed) failed out of \(tests.count) tests.")
	}
}
