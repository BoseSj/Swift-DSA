//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 15/03/26.
//



func maxProfit(_ prices: [Int]) -> Int {
	var buyDay = 0
	var maxProfit = 0
	for index in 0..<prices.count {
		let priceOftheDay = prices[index]
		
		let currentProfit = priceOftheDay - prices[buyDay]
		if currentProfit > maxProfit {
			maxProfit = currentProfit
		}
		else if currentProfit < 0 {
			buyDay = index
		}
	}
	
	return maxProfit
}

