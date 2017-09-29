//
//  OnboardingViewModel.swift
//  Redder
//
//  Created by William Robinson on 9/25/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

struct OnboardingViewModel {

	struct Input {
		let viewDidAppear: Observable<Void>
		let loginButtonTap: ControlEvent<Void>
		let signUpButtonTap: ControlEvent<Void>
		let skipButtonTap: ControlEvent<Void>
	}
	
	private unowned let wireframe: Wireframe
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	func transform(input: Input) {
		wireframe.hideNavigationBar(with: input.viewDidAppear)
		wireframe.transitionToLoginModule(with: input.loginButtonTap.asObservable())
		wireframe.transitionToSignUpModule(with: input.signUpButtonTap.asObservable())
		wireframe.transitionToHomeModule(with: input.skipButtonTap.asObservable())
	}
}
