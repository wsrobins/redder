//
//  LaunchViewController.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

final class LaunchViewController: UIViewController, Bag {
	
	private let viewModel: LaunchViewModel
	
	private var viewOutput: LaunchViewOutput {
		return view as! LaunchViewOutput
	}
	
	init(viewModel: LaunchViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	override func loadView() {
		view = LaunchView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		bindModule()
	}
	
	private func bindModule() {
		let viewModelInput = LaunchViewModel.Input(
			viewWillAppear: rx.viewWillAppear,
			viewDidAppear: rx.viewDidAppear,
			launchAnimation: viewOutput.launchAnimation
		)
		let viewModelOutput = viewModel.transform(input: viewModelInput)
		viewModelOutput
			.hideNavigationBar
			.drive(onNext: { self.hideNavigationBar(animated: $0) })
			.disposed(by: bag)
		viewModelOutput
			.transitionFromLaunchModule
			.drive()
			.disposed(by: bag)
	}
}
