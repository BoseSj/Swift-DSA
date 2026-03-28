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


/// Look at the current element at i
/// Store it in the result array, now we need a min j which is j > i, element[j] <= element[i]
/// so we will need a status for the price
/// let's create a tuple array (priceOfi, priceDiscounted)
/// when discounted price will be from false to true
/// but how to decide the discounting element for the said current element
/// like this we will go through all the elements
/// then return all the first elements of the tuple

func finalPrices(_ prices: [Int]) -> [Int] {
	var result = prices
	var priceLog: [(price: Int, index: Int)] = []
	
	outerLoop: for index in 0..<prices.count {
		let currentPrice = prices[index]
		
		innerLoop: while !priceLog.isEmpty {
			let lastElement = priceLog[priceLog.count-1]
			if lastElement.price >= currentPrice {
				result[lastElement.index] -= currentPrice
				_ = priceLog.popLast()
			} else { break innerLoop }
		}
		
		priceLog.append((price: currentPrice, index: index))
	}
	return result
}

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
	var result = Array(repeating: 0, count: temperatures.count)
	var temperatureLog: [(temp: Int, index: Int)] = []
	
	outerLoop: for index in 0..<temperatures.count {
		let currentTemperature = temperatures[index]
		
		innerLoop: while !temperatureLog.isEmpty {
			let lastTemperature = temperatureLog[temperatureLog.count-1]
			
			if lastTemperature.temp < currentTemperature {
				result[lastTemperature.index] = index - lastTemperature.index
				_ = temperatureLog.popLast()
			} else { break innerLoop }
		}
		
		temperatureLog.append((temp: currentTemperature, index: index))
	}
	
	return result
}


@main
struct SwiftDSA {
	static func main() {
		[
			[73,74,75,71,69,72,76,73],
			[30,40,50,60],
			[30,60,90]
		].forEach { temperatures in
			print("dailyTemperatures(\(temperatures))")
			print(dailyTemperatures(temperatures))
		}
	}
}

