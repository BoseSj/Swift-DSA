//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 27/03/26.
//


func ExclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
	/// Push on Start, Pop on End
	var callStack: [(id: Int, timeStamp: Int)] = []
	var result = Array(repeating: 0, count: n)
	for log in logs {
		let funcID = Int(log.split(separator: ":")[0])!
		let mode = log.split(separator: ":")[1]
		let funcTimeStamp = Int(log.split(separator: ":")[2])!
		
		if mode == "start" {
			if !callStack.isEmpty {
				if let lastFuncNow = callStack.popLast() {
					let lastFuncRunTime = funcTimeStamp - lastFuncNow.timeStamp
					result[lastFuncNow.id] += lastFuncRunTime
					callStack.append((id: lastFuncNow.id, timeStamp: funcTimeStamp))
				}
			}
			callStack.append((id: funcID, timeStamp: funcTimeStamp))
		}
		else {
			if let lastFunc = callStack.popLast() {
				let takenTime = funcTimeStamp - lastFunc.timeStamp + 1
				result[funcID] += takenTime
				
				if let lastFuncNow = callStack.popLast() {
					callStack.append((id: lastFuncNow.id, timeStamp: funcTimeStamp+1))
				}
			}
		}
	}
	
	return result
}