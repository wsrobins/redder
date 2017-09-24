//
//  LaunchViewController.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

final class LaunchViewController: UIViewController {
	
	private let viewModel: LaunchViewModel
	
	private var viewInterface: LaunchViewInterface {
		return self.view as! LaunchViewInterface
	}
	
	init(viewModel: LaunchViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	override func loadView() {
		self.view = LaunchView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.bindModule()
	}
	
	private func bindModule() {
		let viewDidAppearInput: Observable<Void> = self
			.rx
			.sentMessage(#selector(self.viewDidAppear))
			.map { _ in }
		let launchAnimationInput: Observable<Void> = viewInterface.launchAnimation
		let input: LaunchViewModel.Input = LaunchViewModel.Input(viewDidAppear: viewDidAppearInput, launchAnimation: launchAnimationInput)
		_ = self.viewModel.transform(input: input)
	}
}
