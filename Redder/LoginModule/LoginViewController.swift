//
//  LoginViewController.swift
//  Redder
//
//  Created by William Robinson on 9/28/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

final class LoginViewController: UIViewController {
	
	private let viewModel: LoginViewModel
	
	private var viewInterface: LoginViewInterface {
		return self.view as! LoginViewInterface
	}
	
	init(viewModel: LoginViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		title = "Login"
		extendedLayoutIncludesOpaqueBars = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	override func loadView() {
		view = LoginView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		bindModule()
	}
	
	private func bindModule() {
		let input = LoginViewModel.Input(
			viewDidAppear: rx.sentMessage(#selector(viewDidAppear)).map { _ in }
		)
		viewModel.transform(input: input)
	}
}