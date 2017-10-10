//
//  AppNavigationController.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxSwift

protocol Wireframe: class {
	func transitionFromLaunchModule()
	func transitionToOnboardingModule()
	func transitionToHomeModule()
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
		case (is LaunchViewController, _):
			return SlideTransition(direction: .left)
		default:
			return nil
		}
	}
}

extension AppNavigationController: Wireframe {
	
	func transitionFromLaunchModule() {
		transitionToOnboardingModule()
	}
	
	func transitionToOnboardingModule() {
		guard !viewControllers.contains(type: OnboardingViewController.self) else { return }
		let onboardingViewModel = OnboardingViewModel(wireframe: self)
		let onboardingViewController = OnboardingViewController(viewModel: onboardingViewModel)
		self.setViewControllers([onboardingViewController], animated: true)
	}
	
	func transitionToHomeModule() {
		guard !viewControllers.contains(type: HomeViewController.self) else { return }
		let homeViewModel = HomeViewModel(wireframe: self)
		let homeViewController = HomeViewController(viewModel: homeViewModel)
		self.setViewControllers([homeViewController], animated: true)
	}
}
