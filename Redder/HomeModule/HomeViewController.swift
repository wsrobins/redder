//
//  HomeViewController.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

final class HomeViewController: UIViewController {
	
	private let viewModel: HomeViewModel
	
	private var viewInterface: HomeViewInterface {
		return view as! HomeViewInterface
	}
	
	init(viewModel: HomeViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		title = "Redder"
		extendedLayoutIncludesOpaqueBars = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	override func loadView() {
		view = HomeView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		bindModule()
	}
	
	private func bindModule() {
		let input = HomeViewModel.Input(
			viewWillAppear: rx.sentMessage(#selector(viewWillAppear)).map { _ in },
			viewDidAppear: rx.sentMessage(#selector(viewDidAppear)).map { _ in }
		)
		let output = viewModel.transform(input: input)
		viewInterface.bind(feedItems: output.feedItems)
	}
}
