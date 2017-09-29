//
//  SignUpViewController.swift
//  Redder
//
//  Created by William Robinson on 9/28/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

final class SignUpViewController: UIViewController {
	
	private let viewModel: SignUpViewModel
	
	private var viewInterface: SignUpViewInterface {
		return self.view as! SignUpViewInterface
	}
	
	init(viewModel: SignUpViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		title = "Sign Up"
		extendedLayoutIncludesOpaqueBars = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	override func loadView() {
		view = SignUpView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		bindModule()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		print(RxSwift.Resources.total)
	}
	
	deinit {
		print("yep")
	}
	
	private func bindModule() {
		let input = SignUpViewModel.Input(
			viewDidAppear: rx.sentMessage(#selector(viewDidAppear)).map { _ in }
		)
		let output = viewModel.transform(input: input)
	}
}
