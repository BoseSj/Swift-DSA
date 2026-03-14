//
//  File.swift
//  SwiftDSA
//
//  Created by Cepheus on 08/12/25.
//

import Foundation

public struct CustomArray<Model: Equatable> {
	public let value: Model
	
	public init(value: Model) {
		self.value = value
	}
}
