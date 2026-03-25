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
func exclusiveTime2(_ n: Int, _ logs: [String]) -> [Int] {
	var runTimeLog: [Int] = Array(repeating: -1,
								  count: Int(logs[logs.count-1].split(separator: ":")[2])!+1)
	
	/// Push on Start, Pop on End
	var callStack: [(id: Int, timeStamp: Int)] = []
	for log in logs {
		let funcID = Int(log.split(separator: ":")[0])!
		let mode = log.split(separator: ":")[1]
		let funcTimeStamp = Int(log.split(separator: ":")[2])!
		
		if mode == "start" {
			callStack.append((id: funcID, timeStamp: funcTimeStamp))
		}
		else {
			if let lastFunc = callStack.popLast() {
				for index in lastFunc.timeStamp...funcTimeStamp {
					if runTimeLog[index] == -1 {
						runTimeLog[index] = lastFunc.id
					}
				}
			}
			
		}
	}
	
	var result = Array(repeating: 0, count: n)
	for log in runTimeLog {
		if log >= 0 {
			result[log] += 1
		}
	}
	
	return result
}

func optimisedExclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
	/// Push on Start, Pop on End
	var callStack: [(id: Int, timeStamp: Int)] = []
	var result = Array(repeating: 0, count: n)
	var previousLapsedTime = 0
	for log in logs {
		let funcID = Int(log.split(separator: ":")[0])!
		let mode = log.split(separator: ":")[1]
		let funcTimeStamp = Int(log.split(separator: ":")[2])!
		
		if mode == "start" {
			callStack.append((id: funcID, timeStamp: funcTimeStamp))
		}
		else {
			if let lastFunc = callStack.popLast() {
				let lapsedTime = funcTimeStamp - lastFunc.timeStamp + 1
				result[lastFunc.id] += lapsedTime
				
				print("lastFunc")
				print(lastFunc)
				print("lapsedTime")
				print(lapsedTime)
				print("!callStack.isEmpty")
				print(!callStack.isEmpty)
				
				if !callStack.isEmpty {
					print("last stack item")
					print(callStack[callStack.count-1])
					callStack[callStack.count-1].timeStamp += lapsedTime/* + previousLapsedTime*/
//					previousLapsedTime += lapsedTime
					print("updated stack item")
					print(callStack[callStack.count-1])
				}
//				else {
//					previousLapsedTime = 0
//				}
			}
		}
	}
	
	return result
}

@main
struct SwiftDSA {
	static func main() {
		print(
			optimisedExclusiveTime(
				8,
				[
					"0:start:0",
					"1:start:5",
					"2:start:6",
					"3:start:9",
					"4:start:11",
					"5:start:12",
					"6:start:14",
//					"7:start:15",
//					"1:start:24",
//					"1:end:29",
//					"7:end:34",
					"6:end:37",
					"5:end:39",
					"4:end:40",
					"3:end:45",
					"0:start:49",
					"0:end:54",
					"5:start:55",
					"5:end:59",
					"4:start:63",
					"4:end:66",
					"2:start:69",
					"2:end:70",
					"2:start:74",
					"6:start:78",
					"0:start:79",
					"0:end:80",
					"6:end:85",
					"1:start:89",
					"1:end:93",
					"2:end:96",
					"2:end:100",
					"1:end:102",
					"2:start:105",
					"2:end:109",
					"0:end:114"
				]
			)
		)
	}
}

