//
//  ViewModelType.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

protocol ViewModelType {
	associatedtype Input
	associatedtype Output
	func transform(input: Input) -> Output
}
