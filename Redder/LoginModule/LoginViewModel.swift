//
//  LoginViewModel.swift
//  Redder
//
//  Created by William Robinson on 9/28/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

struct LoginViewModel {

	struct Input {
		let viewDidAppear: Observable<Void>
		let backgroundTap: Observable<Void>
	}
	
	struct Output {
		let dismissKeyboard: Observable<Void>
	}
	
	private unowned let wireframe: Wireframe
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	func transform(input: Input) -> Output {
		wireframe.showNavigationBar(with: input.viewDidAppear)
		return Output(
			dismissKeyboard: input.backgroundTap
		)
	}
}
