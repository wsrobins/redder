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
		let usernameFieldText: Observable<String>
		let passwordFieldText: Observable<String>
		let usernameFieldReturnKeyTap: Observable<Void>
		let passwordFieldReturnKeyTap: Observable<Void>
		let logInButtonTap: Observable<(String, String)>
		let backgroundTap: Observable<Void>
	}
	
	struct Output {
		let showNavigationBar: Observable<Bool>
		let presentKeyboard: Observable<Void>
		let dismissKeyboard: Observable<Void>
		let nextField: Observable<Void>
		let toggleLogInButtonIsHidden: Observable<Bool>
//		let presentInvalidLoginAlert: Observable<String>
	}
	
	private let loginSerivce: LoginService
	private unowned let wireframe: Wireframe
	
	init(loginService: LoginService = LoginService(), wireframe: Wireframe) {
		self.loginSerivce = loginService
		self.wireframe = wireframe
	}
	
	func transform(input: Input) -> Output {
		loginSerivce.authenticateUser(with: input.logInButtonTap)
		return Output(
			showNavigationBar: input.viewDidAppear.map { true },
			presentKeyboard: input.viewDidAppear,
			dismissKeyboard: .merge(input.passwordFieldReturnKeyTap, input.backgroundTap),
			nextField: input.usernameFieldReturnKeyTap,
			toggleLogInButtonIsHidden: Observable
				.combineLatest(input.usernameFieldText, input.passwordFieldText)
				.map { username, password in username.isEmpty || password.isEmpty }
//			presentInvalidLoginAlert: loginSerivce.validateCredentials(with: input.logInButtonTap)
		)
	}
}
