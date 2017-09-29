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
		let viewDidAppear: Observable<Void>
		let launchAnimation: Observable<Void>
	}
	
	private unowned let wireframe: Wireframe
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}

	func transform(input: Input) {
		wireframe.transitionFromLaunchModule(with: input.viewDidAppear.flatMap { input.launchAnimation })
	}
}
