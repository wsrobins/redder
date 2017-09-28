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
		return nil
		if fromVC is LaunchViewController {
			return SlideTransition()
		}
		switch (fromVC, toVC) {
		default:
			return nil
		}
	}
}

extension AppNavigationController: Wireframe {
	
	func showNavigationBar(with observable: Observable<Void>) {
		observable
			.filter { self.navigationBar.isHidden }
			.bind { self.setNavigationBarHidden(false, animated: true) }
			.disposed(by: disposeBag)
	}
	
	func hideNavigationBar(with observable: Observable<Void>) {
		observable
			.filter { !self.navigationBar.isHidden }
			.bind { self.setNavigationBarHidden(true, animated: true) }
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
			.bind {
				self.setViewControllers([onboardingViewController], animated: true)
			}
			.disposed(by: disposeBag)
	}
	
	func transitionToLoginModule(with observable: Observable<Void>) {
		let loginViewModel = LoginViewModel(wireframe: self)
		let loginViewController = LoginViewController(viewModel: loginViewModel)
		observable
			.takeUntil(loginViewController.rx.deallocated)
			.bind {
				self.pushViewController(loginViewController, animated: true)
			}
			.disposed(by: self.disposeBag)
	}
	
	func transitionToSignUpModule(with observable: Observable<Void>) {
		let signUpViewModel = SignUpViewModel(wireframe: self)
		let signUpViewController = SignUpViewController(viewModel: signUpViewModel)
		observable
			.takeUntil(signUpViewController.rx.deallocated)
			.bind {
				self.pushViewController(signUpViewController, animated: true)
			}
			.disposed(by: disposeBag)
	}
	
	func transitionToHomeModule(with observable: Observable<Void>) {
		let homeViewModel = HomeViewModel(wireframe: self)
		let homeViewController = HomeViewController(viewModel: homeViewModel)
		observable
			.take(1)
			.bind {
				self.setViewControllers([homeViewController], animated: true)
			}
			.disposed(by: disposeBag)
	}
}
