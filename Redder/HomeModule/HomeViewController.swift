//
//  HomeViewController.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

final class HomeViewController: UIViewController, ShowNavigationBar, Bag {
	
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
			viewWillAppear: rx.viewWillAppear,
			viewDidAppear: rx.viewDidAppear
		)
		let output = viewModel.transform(input: input)
		showNavigationBar(with: output.showNavigationBar)
		viewInterface.bind(feedItems: output.feedItems)
	}
}
