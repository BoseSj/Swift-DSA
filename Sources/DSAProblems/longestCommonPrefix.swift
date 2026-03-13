//
//  File.swift
//  SwiftUniverse
//
//  Created by Cepheus on 13/03/26.
//


import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
	let sortedArray = Array(strs
		.sorted()
		.reversed())
	
	return findValue(sortedArray)
}


func findValue(_ strs: [String]) -> String {
	guard !strs.isEmpty else { return "" }
	if strs.count == 1 { return strs.first! }
	guard let first = strs.first else { return "" }
	guard !first.isEmpty else { return "" }
	
	if strs.allSatisfy({ item in
		item.hasPrefix(first)
	}) {
		return first
	} else {
		var newArray = strs
		newArray[0].removeLast()
		return findValue(newArray)
	}
}
