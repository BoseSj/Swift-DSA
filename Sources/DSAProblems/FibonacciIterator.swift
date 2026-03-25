//
//  FibonacciIterator.swift
//  SwiftDSA
//
//  Created by Cepheus on 25/03/26.
//


import Foundation


struct FibonacciIterator: IteratorProtocol {
	typealias Element = Int

	var secondLast: Element = 0
	var last: Element = 0
	
	mutating func next() -> Int? {
		defer {
			let value = secondLast == 0 ? 1 : last
			self.last = last+secondLast
			self.secondLast = value
		}
		return last+secondLast
	}
}

