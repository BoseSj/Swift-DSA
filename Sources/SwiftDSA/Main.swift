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


/// ["0:start:0","1:start:2","1:end:5","0:end:6"]

func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
	var timeLog: [[Int]] = Array(repeating: [], count: n)
	for log in logs {
		let functionID = Int(log.components(separatedBy: ":")[0])!
		let time = Int(log.components(separatedBy: ":")[2])!
		
		timeLog[functionID].append(time)
	}
	print("timeLog")
	print(timeLog)
	
	var timeMap: [Int] = Array(repeating: -1, count: Int(logs[logs.count-1].split(separator: ":")[2])! + 1)
	for operation in 0..<timeLog.count {
		let time = timeLog[operation]
		for timeIndex in time[0]...time[time.count-1] {
			timeMap[timeIndex] = operation
		}
	}
	print("timeMap")
	print(timeMap)
	
	var operationCount = Array(repeating: 0, count: n)
	for index in 0..<timeMap.count {
		if timeMap[index] >= 0 {
			let operation = timeMap[index]
			operationCount[operation] += 1
		}
	}
	
	return operationCount
}


// MARK: - Tests for exclusiveTime
@discardableResult
func runExclusiveTimeTests() -> Bool {
    typealias TestCase = (name: String, n: Int, logs: [String], expected: [Int])

    let cases: [TestCase] = [
        (
            "Example 1 (nested)",
            2,
            ["0:start:0","1:start:2","1:end:5","0:end:6"],
            [3,4]
        ),
        (
            "Sequential non-overlapping",
            3,
            ["0:start:0","0:end:0","1:start:1","1:end:1","2:start:2","2:end:2"],
            [1,1,1]
        ),
        (
            "Immediate start/end same timestamp",
            1,
            ["0:start:7","0:end:7"],
            [1]
        ),
        (
            "Single function multiple segments",
            1,
            ["0:start:0","0:end:1","0:start:3","0:end:3","0:start:5","0:end:7"],
            [5]
        ),
        (
            "Nested depth 2",
            1,
            ["0:start:0","0:start:1","0:end:2","0:end:3"],
            [4]
        ),
        (
            "Interleaved siblings",
            2,
            ["0:start:0","0:end:0","1:start:1","1:end:2"],
            [1,2]
        ),
        (
            "Longer nested with sibling",
            2,
            ["0:start:0","0:start:2","0:end:5","1:start:6","1:end:6","0:end:7"],
            [5,1]
        ),
        (
            "Multiple calls of same function id",
            2,
            ["0:start:0","0:end:0","0:start:1","0:end:1","1:start:2","1:end:4"],
            [2,3]
        )
    ]

    var allPassed = true
    for tc in cases {
        let got = exclusiveTime(tc.n, tc.logs)
        let pass = got == tc.expected
        if pass {
            print("✅ \(tc.name): PASSED")
        } else {
            print("❌ \(tc.name): FAILED — expected \(tc.expected), got \(got)")
        }
        allPassed = allPassed && pass
    }

    return allPassed
}

@main
struct SwiftDSA {
	static func main() {
        let ok = runExclusiveTimeTests()
        if ok {
            print("✅ All exclusiveTime test cases PASSED")
        } else {
            print("❌ Some exclusiveTime test cases FAILED")
        }
	}
}

