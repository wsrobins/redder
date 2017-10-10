//
//  OnboardingViewController.swift
//  Redder
//
//  Created by William Robinson on 9/25/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

final class OnboardingViewController: UIViewController, Bag {

	private let viewModel: OnboardingViewModel
	
	private var viewOutput: OnboardingViewOutput {
		return view as! OnboardingViewOutput
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
//		let viewModelInput = OnboardingViewModel.Input(
//			viewDidAppear: rx.viewDidAppear,
//			signUpButtonTap: viewOutput.signUpButtonTap,
//			skipButtonTap: viewOutput.skipButtonTap
//		)
//		let viewModelOutput = viewModel.transform(input: viewModelInput)
//		hideNavigationBar(with: viewModelOutput.hideNavigationBar)
	}
}
