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
		return view as! LaunchViewInterface
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
		let input = LaunchViewModel.Input(
			viewDidAppear: rx.sentMessage(#selector(viewDidAppear)).map { _ in },
			launchAnimation: viewInterface.launchAnimation
		)
		viewModel.transform(input: input)
	}
}
