//
//  LoginViewModel.swift
//  Redder
//
//  Created by William Robinson on 9/28/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

struct LoginViewModel: ViewModelType {

	struct Input {
		let viewDidAppear: Observable<Void>
	}
	
	struct Output {
		
	}
	
	private unowned let wireframe: Wireframe
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	@discardableResult
	func transform(input: Input) -> Output {
		wireframe.showNavigationBar(with: input.viewDidAppear)
		return Output()
	}
}
