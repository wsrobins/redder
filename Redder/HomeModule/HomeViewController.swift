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
		return self.view as! HomeViewInterface
	}
	
	init(viewModel: HomeViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		self.title = "Redder"
		self.extendedLayoutIncludesOpaqueBars = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	override func loadView() {
		self.view = HomeView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.bindModule()
	}
	
	private func bindModule() {
		let viewWillAppearInput: Observable<Void> = self
			.rx
			.sentMessage(#selector(self.viewWillAppear))
			.map { _ in
				return ()
		}
		let viewDidAppearInput: Observable<Void> = self
			.rx
			.sentMessage(#selector(self.viewDidAppear))
			.map { _ in
				return ()
		}
		let input: HomeViewModel.Input = HomeViewModel.Input(viewWillAppear: viewWillAppearInput, viewDidAppear: viewDidAppearInput)
		let output: HomeViewModel.Output = viewModel.transform(input: input)
		self.viewInterface.bind(feedItems: output.feedItems)
	}
}
