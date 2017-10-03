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
		let viewWillAppear: Observable<Void>
		let viewDidAppear: Observable<Void>
		let launchAnimation: Observable<Void>
	}
	
	struct Output {
		let hideNavigationBar: Observable<Bool>
	}
	
	private unowned let wireframe: Wireframe
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	func transform(input: Input) -> Output {
		wireframe.transitionFromLaunchModule(with: input.viewDidAppear.flatMap { input.launchAnimation })
		return Output(
			hideNavigationBar: input.viewWillAppear.map { false }
		)
	}
}
