//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 29/03/26.
//


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