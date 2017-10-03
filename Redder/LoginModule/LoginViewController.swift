//
//  LoginViewController.swift
//  Redder
//
//  Created by William Robinson on 9/28/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

final class LoginViewController: UIViewController, ShowNavigationBar, Bag {
	
	private let viewModel: LoginViewModel
	
	private var viewInterface: LoginViewInterface {
		return self.view as! LoginViewInterface
	}
	
	init(viewModel: LoginViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		title = "Log In"
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
			viewDidAppear: rx.viewDidAppear,
			usernameFieldText: viewInterface.usernameFieldText,
			passwordFieldText: viewInterface.passwordFieldText,
			usernameFieldReturnKeyTap: viewInterface.usernameFieldReturnKeyTap,
			passwordFieldReturnKeyTap: viewInterface.passwordFieldReturnKeyTap,
			logInButtonTap: viewInterface.logInButtonTap,
			backgroundTap: viewInterface.backgroundTap
		)
		let output = viewModel.transform(input: input)
		showNavigationBar(with: output.showNavigationBar)
//		presentInvalidLoginAlert(with: output.presentInvalidLoginAlert)
		viewInterface.presentKeyboard(with: output.presentKeyboard)
		viewInterface.dismissKeyboard(with: output.dismissKeyboard)
		viewInterface.nextField(with: output.nextField)
		viewInterface.toggleLogInButtonIsHidden(with: output.toggleLogInButtonIsHidden)
	}
	
	private func presentInvalidLoginAlert(with observable: Observable<String>) {
		observable
			.bind { [unowned self] alertTitle in
				let invalidLoginAlertController = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
				let dismissAlertAction = UIAlertAction(title: "Dismiss", style: .default)
				invalidLoginAlertController.addAction(dismissAlertAction)
				self.present(invalidLoginAlertController, animated: true, completion: nil)
			}
			.disposed(by: bag)
	}
}
