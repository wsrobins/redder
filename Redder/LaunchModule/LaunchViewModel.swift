//
//  LaunchViewModel.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

struct LaunchViewModel {
	
	struct Input {
		let viewWillAppear: Driver<Void>
		let viewDidAppear: Driver<Void>
		let launchAnimation: Driver<Void>
	}
	
	struct Output {
		let hideNavigationBar: Driver<Bool>
		let transitionFromLaunchModule: Driver<Void>
	}
	
	private unowned let wireframe: Wireframe
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	func transform(input: Input) -> Output {
		return Output(
			hideNavigationBar: input
				.viewWillAppear
				.map { false },
			transitionFromLaunchModule: input
				.viewDidAppear
				.flatMap { input.launchAnimation }
				.do(onNext: { self.wireframe.transitionFromLaunchModule() })
		)
	}
}
