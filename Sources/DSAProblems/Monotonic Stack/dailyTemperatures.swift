//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 29/03/26.
//


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