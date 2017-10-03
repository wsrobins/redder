//
//  AppNavigationController.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxSwift

protocol Wireframe: class {
	func transitionFromLaunchModule(with observable: Observable<Void>)
	func transitionToOnboardingModule(with observable: Observable<Void>)
	func transitionToLoginModule(with observable: Observable<Void>)
	func transitionToSignUpModule(with observable: Observable<Void>)
	func transitionToHomeModule(with observable: Observable<Void>)
}

class AppNavigationController: UINavigationController, Bag {
	
	init() {
		super.init(navigationBarClass: AppNavigationBar.self, toolbarClass: nil)
		delegate = self
		setUpLaunchModule()
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	private func setUpLaunchModule() {
		let launchViewModel = LaunchViewModel(wireframe: self)
		let launchViewController = LaunchViewController(viewModel: launchViewModel)
		viewControllers = [launchViewController]
	}
}

extension AppNavigationController: UINavigationControllerDelegate {
	
	func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		switch (fromVC, toVC) {
		case (is LaunchViewController, _),
		     (is OnboardingViewController, _):
			return SlideTransition(direction: .left)
		case (is LoginViewController, is OnboardingViewController),
		     (is SignUpViewController, is OnboardingViewController):
			return SlideTransition(direction: .right)
		default:
			return nil
		}
	}
}

extension AppNavigationController: Wireframe {
	
	func transitionFromLaunchModule(with observable: Observable<Void>) {
		transitionToOnboardingModule(with: observable.take(1))
	}
	
	func transitionToOnboardingModule(with observable: Observable<Void>) {
		observable
			.bind { [unowned self] in
				let onboardingViewModel = OnboardingViewModel(wireframe: self)
				let onboardingViewController = OnboardingViewController(viewModel: onboardingViewModel)
				self.setViewControllers([onboardingViewController], animated: true)
			}
			.disposed(by: bag)
	}
	
	func transitionToLoginModule(with observable: Observable<Void>) {
		observable
			.bind { [unowned self] in
				let loginViewModel = LoginViewModel(wireframe: self)
				let loginViewController = LoginViewController(viewModel: loginViewModel)
				self.pushViewController(loginViewController, animated: true)
			}
			.disposed(by: bag)
	}
	
	func transitionToSignUpModule(with observable: Observable<Void>) {
		observable
			.bind { [unowned self] in
				let signUpViewModel = SignUpViewModel(wireframe: self)
				let signUpViewController = SignUpViewController(viewModel: signUpViewModel)
				self.pushViewController(signUpViewController, animated: true)
			}
			.disposed(by: bag)
	}
	
	func transitionToHomeModule(with observable: Observable<Void>) {
		observable
			.take(1)
			.bind { [unowned self] in
				let homeViewModel = HomeViewModel(wireframe: self)
				let homeViewController = HomeViewController(viewModel: homeViewModel)
				self.setViewControllers([homeViewController], animated: true)
			}
			.disposed(by: bag)
	}
}
