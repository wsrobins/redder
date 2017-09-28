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
		let viewDidAppear: Observable<Void>
		let launchAnimation: Observable<Void>
	}
	
	struct Output {}
	
	private unowned let wireframe: Wireframe
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	@discardableResult
	func transform(input: Input) -> Output {
		wireframe.transitionFromLaunchModule(with: input.viewDidAppear.flatMap { input.launchAnimation })
		return Output()
	}
}
