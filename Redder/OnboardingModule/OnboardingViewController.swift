//
//  OnboardingViewController.swift
//  Redder
//
//  Created by William Robinson on 9/25/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

final class OnboardingViewController: UIViewController, HideNavigationBar, Bag {

	private let viewModel: OnboardingViewModel
	
	private var viewInterface: OnboardingViewInterface {
		return view as! OnboardingViewInterface
	}
	
	init(viewModel: OnboardingViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		extendedLayoutIncludesOpaqueBars = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	override func loadView() {
		view = OnboardingView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		bindModule()
	}
	
	private func bindModule() {
		let input = OnboardingViewModel.Input(
			viewDidAppear: rx.viewDidAppear,
			loginButtonTap: viewInterface.logInButtonTap,
			signUpButtonTap: viewInterface.signUpButtonTap,
			skipButtonTap: viewInterface.skipButtonTap
		)
		let output = viewModel.transform(input: input)
		hideNavigationBar(with: output.hideNavigationBar)
	}
}
