//
//  AppNavigationController.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

protocol Wireframe: class {
	func showNavigationBar(with observable: Observable<Void>)
	func hideNavigationBar(with observable: Observable<Void>)
	func transitionFromLaunchModule(with observable: Observable<Void>)
	func transitionToOnboardingModule(with observable: Observable<Void>)
	func transitionToLoginModule(with observable: Observable<Void>)
	func transitionToSignUpModule(with observable: Observable<Void>)
	func transitionToHomeModule(with observable: Observable<Void>)
}

class AppNavigationController: UINavigationController {
	
	private let disposeBag = DisposeBag()
	
	init() {
		super.init(navigationBarClass: AppNavigationBar.self, toolbarClass: nil)
		delegate = self
		isNavigationBarHidden = true
		let launchViewModel = LaunchViewModel(wireframe: self)
		let launchViewController = LaunchViewController(viewModel: launchViewModel)
		viewControllers = [launchViewController]
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
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
	
	func showNavigationBar(with observable: Observable<Void>) {
		observable
			.filter { [unowned self] in self.navigationBar.isHidden }
			.bind { [unowned self] in self.setNavigationBarHidden(false, animated: true) }
			.disposed(by: disposeBag)
	}
	
	func hideNavigationBar(with observable: Observable<Void>) {
		observable
			.filter { [unowned self] in !self.navigationBar.isHidden }
			.bind { [unowned self] in self.setNavigationBarHidden(true, animated: true) }
			.disposed(by: disposeBag)
	}
	
	func transitionFromLaunchModule(with observable: Observable<Void>) {
		transitionToOnboardingModule(with: observable)
	}
	
	func transitionToOnboardingModule(with observable: Observable<Void>) {
		let onboardingViewModel = OnboardingViewModel(wireframe: self)
		let onboardingViewController = OnboardingViewController(viewModel: onboardingViewModel)
		observable
			.take(1)
			.bind { [unowned self, onboardingViewController] in self.setViewControllers([onboardingViewController], animated: true) }
			.disposed(by: disposeBag)
	}
	
	func transitionToLoginModule(with observable: Observable<Void>) {
		let loginViewModel = LoginViewModel(wireframe: self)
		let loginViewController = LoginViewController(viewModel: loginViewModel)
		observable
			.takeUntil(loginViewController.rx.deallocated)
			.bind { [unowned self, loginViewController] in self.pushViewController(loginViewController, animated: true) }
			.disposed(by: self.disposeBag)
	}
	
	func transitionToSignUpModule(with observable: Observable<Void>) {
		observable
			.bind { [unowned self] in self.pushViewController(SignUpViewController(viewModel: SignUpViewModel(wireframe: self)), animated: true) }
			.disposed(by: disposeBag)
	}
	
	func transitionToHomeModule(with observable: Observable<Void>) {
		let homeViewModel = HomeViewModel(wireframe: self)
		let homeViewController = HomeViewController(viewModel: homeViewModel)
		observable
			.take(1)
			.bind { [unowned self] in self.setViewControllers([homeViewController], animated: true) }
			.disposed(by: disposeBag)
	}
}
