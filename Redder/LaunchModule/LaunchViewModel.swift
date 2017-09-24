//
//  LaunchViewModel.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

struct LaunchViewModel: ViewModelType {

	struct Input {
		let launchAnimation: Observable<Void>
	}
	
	struct Output {}
	
	private unowned let wireframe: Wireframe
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	func transform(input: Input) -> Output {
		self.wireframe.transitionToHomeModule(with: input.launchAnimation)
		return Output()
	}
}
