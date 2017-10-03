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
		let loginButtonTap: Observable<Void>
		let signUpButtonTap: Observable<Void>
		let skipButtonTap: Observable<Void>
	}
	
	struct Output {
		let hideNavigationBar: Observable<Bool>
	}
	
	private unowned let wireframe: Wireframe
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	func transform(input: Input) -> Output {
		wireframe.transitionToLoginModule(with: input.loginButtonTap)
		wireframe.transitionToSignUpModule(with: input.signUpButtonTap)
		wireframe.transitionToHomeModule(with: input.skipButtonTap)
		return Output(
			hideNavigationBar: input.viewDidAppear.map { true }
		)
	}
}
