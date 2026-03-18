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


func largestOddNumber(_ num: String) -> String {
	var result = num
	
	while !result.isEmpty {
		
		let lastnum =  Int(String(result.last!))!
		if lastnum%2 != 0 { break }
		_ = result.popLast()
	}
	
	return result
}

func evalRPN(_ tokens: [String]) -> Int {
	func calculate(x: Int, y: Int, operation: String) -> Int {
		switch operation {
			case "+": x+y
			case "-": x-y
			case "*": x*y
			case "/": x/y
			default: x
		}
	}
	var evalutationArray: [Int] = []
	for index in 0..<tokens.count {
		let currentItem = tokens[index]
		if let digit = Int(currentItem) {
			evalutationArray.append(digit)
		}
		else {
			if evalutationArray.count >= 2 {
				let lastDigit = evalutationArray.popLast()!
				let secondLastDigit = evalutationArray.popLast()!
				evalutationArray.append(calculate(x: lastDigit, y: secondLastDigit,
												  operation: currentItem))
			}
		}
		
	}
	
	return evalutationArray.first ?? 0
}


@main
struct SwiftDSA {
	static func main() {
		// Inline tests for evalRPN(_:) — prints pass/fail per case and a summary
		let rpnTests: [([String], Int)] = [
			// Single number
			(["3"], 3),
			(["-42"], -42),
			// Basic operations
			(["2", "1", "+"], 3),
			(["5", "3", "-"], 2),
			(["4", "6", "*"], 24),
			(["8", "2", "/"], 4),
			// Truncation toward zero in division
			(["-7", "2", "/"], -3),      // -7/2 -> -3
			(["7", "-2", "/"], -3),      // 7/-2 -> -3
			(["-7", "-2", "/"], 3),      // -7/-2 -> 3
			(["-3", "-2", "/"], 1),      // -3/-2 -> 1
			// Composite expressions
			(["2", "1", "+", "3", "*"], 9), // (2+1)*3
			(["4", "13", "5", "/", "+"], 6), // 4 + (13/5) -> 4 + 2
			(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"], 22),
			(["5", "1", "2", "+", "4", "*", "+", "3", "-"], 14) // 5 + (1+2)*4 - 3
		]

		var passed = 0
		var failed = 0
		for (i, test) in rpnTests.enumerated() {
			let (tokens, expected) = test
			let got = evalRPN(tokens)
			let ok = got == expected
			if ok { passed += 1 } else { failed += 1 }
			print("RPN Test #\(i + 1): \(ok ? "PASSED" : "FAILED")")
			print("  tokens  = \(tokens)")
			print("  expected= \(expected)")
			print("  got     = \(got)\n")
		}
		print("RPN Summary: \(passed) passed, \(failed) failed out of \(rpnTests.count) tests.")
	}
}
