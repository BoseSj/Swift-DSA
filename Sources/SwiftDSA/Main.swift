// The Swift Programming Language
// https://docs.swift.org/swift-book

import DSATopics
import DSAProblems


func calculateRectHeight(heights: [Int]) -> Int {
	(heights.min() ?? 0) * heights.count
}

func largestRectangleArea(_ heights: [Int]) -> Int {
	var maxHeight = calculateRectHeight(heights: heights)
	var heightStack = [Int]()
	for height in heights {
		if !heightStack.isEmpty {
			let currentHeight = calculateRectHeight(heights: heightStack)
			let comingHeight = calculateRectHeight(heights: heightStack + [height])
			let immediateHeight = calculateRectHeight(heights: [heightStack.last!, height])
			let nextHeight = calculateRectHeight(heights: [height])
			let currentMaxHeight = max(currentHeight, comingHeight, immediateHeight)
			maxHeight = max(currentMaxHeight, maxHeight)
			
			print("currentHeight \(currentHeight) comingHeight \(comingHeight) immediateHeight \(immediateHeight) nextHeight \(nextHeight) currentMaxHeight \(currentMaxHeight)")
			switch currentMaxHeight {
				case nextHeight, currentHeight:
					print("Current height is max: \(heightStack) -> \(currentMaxHeight)")
					heightStack.removeAll()
					heightStack.append(height)
				case comingHeight:
					if comingHeight == immediateHeight {
						let last = heightStack.last!
						heightStack.removeAll()
						heightStack.append(last)
					}
					heightStack.append(height)
					print("Coming height ll be max: \(heightStack) -> \(currentMaxHeight)")
				case immediateHeight:
					_ = heightStack.removeFirst()
					heightStack.append(height)
					print("Immediate height ll be max: \(heightStack) -> \(currentMaxHeight)")
				default:
					print("Nothing")
			}
		}
		else {
			heightStack.append(height)
			maxHeight = max(maxHeight, calculateRectHeight(heights: heightStack))
			print("Immediate height might be max: \(heightStack) -> \(calculateRectHeight(heights: heightStack))")
		}
	}
	
	return maxHeight
}


	@main
	struct SwiftDSA {
		static func main() {
			let testCases: [(heights: [Int], expected: Int)] = [
//				([1, 2, 4, 5, 1, 4], 8),
//				([2, 1, 5, 6, 2, 3], 10),
//				([2, 4], 4),
//				([2, 1, 2], 3),
//				([1], 1),
//				([1, 1], 2),
//				([1, 1, 1, 1], 4),
//				([4, 2, 0, 3, 2, 5], 6),
//				([6, 2, 5, 4, 5, 1, 6], 12),
//				([2, 3, 4, 5, 6], 12),
				([0,1,2,3,4,5,6,7,8], 20),
//				([6, 5, 4, 3, 2], 12),
//				([0, 0, 0], 0),
//				([2, 0, 2], 2),
//				([5, 5, 1, 7, 1, 1, 5, 2, 7, 6], 12)
			]
			
			var isAllPass = true
			testCases.forEach { testCase in
				let actual = largestRectangleArea(testCase.heights)
				let status = actual == testCase.expected ? "PASS" : "FAIL"
				if actual != testCase.expected {
					isAllPass = false
				}
				print("largestRectangleArea(\(testCase.heights))")
				print("expected: \(testCase.expected), actual: \(actual) -> \(status)")
			}
			
			if isAllPass {
				print("✅ All Passed")
			} else {
				print("❌ Some Failed")
			}
		}
	}
