//
//  SignUpViewModel.swift
//  Redder
//
//  Created by William Robinson on 9/28/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

struct SignUpViewModel {

	struct Input {
		let viewDidAppear: Observable<Void>
	}
	
	struct Output {
		let showNavigationBar: Observable<Bool>
	}
	
	private unowned let wireframe: Wireframe
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	func transform(input: Input) -> Output {
		return Output(
			showNavigationBar: input.viewDidAppear.map { true }
		)
	}
}
