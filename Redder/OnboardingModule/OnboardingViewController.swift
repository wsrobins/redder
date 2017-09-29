//
//  OnboardingViewController.swift
//  Redder
//
//  Created by William Robinson on 9/25/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

final class OnboardingViewController: UIViewController {
	
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
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		print(RxSwift.Resources.total)
	}
	
	private func bindModule() {
		let input = OnboardingViewModel.Input(
			viewDidAppear: rx.sentMessage(#selector(viewDidAppear)).map { _ in },
			loginButtonTap: viewInterface.loginButtonTap,
			signUpButtonTap: viewInterface.signUpButtonTap,
			skipButtonTap: viewInterface.skipButtonTap
		)
		viewModel.transform(input: input)
	}
}
