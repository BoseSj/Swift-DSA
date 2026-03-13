// The Swift Programming Language
// https://docs.swift.org/swift-book

import DSATopics


extension String {
	var reverseItem: String? {
		switch self {
			case "(": ")"
			case "{": "}"
			case "[": "]"
			default: nil
		}
	}
}

func isValidParentheses(_ s: String) -> Bool {
	guard !s.isEmpty else { return true }
	guard s.count%2 == 0 else {
		return false
	}
	
	var reduced = s
	let firstItem = String(reduced.first!)
	guard let reverseItem = firstItem.reverseItem else {
		return false
	}
	reduced.removeFirst()
	if let index = reduced.firstIndex(where: { item in
		String(item) == reverseItem
	}) {
		reduced.remove(at: index)
		return isValidParentheses(reduced)
	}
	else {
		return false
	}
}


@main
struct swiftDSA {
    static func main() {
		
    }
}
