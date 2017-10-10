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
		let viewDidAppear: Driver<Void>
	}
	
	struct Output {
		let loadAuthURLRequest: Driver<URLRequest>
		let hideNavigationBar: Driver<Bool>
	}
	
	private unowned let wireframe: Wireframe
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	func transform(input: Input) -> Output {
		let authURLRequest = URLRequest(url: URL(string: "https://www.reddit.com/api/v1/authorize.compact?client_id=\(Secrets.clientID)&response_type=code&state=lol&redirect_uri=https://google.com&duration=permanent&scope=mysubreddits")!)
		return Output(
			loadAuthURLRequest: input.viewDidAppear.map { authURLRequest },
			hideNavigationBar: input.viewDidAppear.map { true }
		)
	}
}
