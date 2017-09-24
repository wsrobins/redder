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
	func transitionToHomeModule(with observable: Observable<Void>)
}

class AppNavigationController: UINavigationController {
	
	private let disposeBag: DisposeBag = DisposeBag()
	
	init() {
		super.init(navigationBarClass: AppNavigationBar.self, toolbarClass: nil)
		self.isNavigationBarHidden = true
		let launchViewModel: LaunchViewModel = LaunchViewModel(wireframe: self)
		let launchViewController: LaunchViewController = LaunchViewController(viewModel: launchViewModel)
		self.viewControllers = [launchViewController]
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
	}
}

extension AppNavigationController: Wireframe {
	
	func showNavigationBar(with observable: Observable<Void>) {
		observable
			.bind {
				self.setNavigationBarHidden(false, animated: true)
			}
			.disposed(by: self.disposeBag)
	}
	
	func transitionToHomeModule(with observable: Observable<Void>) {
		observable
			.take(1)
			.bind {
				let homeViewModel: HomeViewModel = HomeViewModel(wireframe: self)
				let homeViewController: HomeViewController = HomeViewController(viewModel: homeViewModel)
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
					self?.setViewControllers([homeViewController], animated: true)
				}
			}
			.disposed(by: self.disposeBag)
	}
}
