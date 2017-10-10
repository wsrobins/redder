//
//  UIViewController+Rx.swift
//  Redder
//
//  Created by William Robinson on 9/30/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

extension Reactive where Base: UIViewController {
	
	var viewDidLoad: Driver<Void> {
		return sentMessage(#selector(base.viewDidLoad))
			.map { _ in }
			.asDriver(onErrorJustReturn: ())
	}
	
	var viewWillAppear: Driver<Void> {
		return sentMessage(#selector(base.viewWillAppear))
			.map { _ in }
			.asDriver(onErrorJustReturn: ())
	}
	
	var viewDidAppear: Driver<Void> {
		return sentMessage(#selector(base.viewDidAppear))
			.map { _ in }
			.asDriver(onErrorJustReturn: ())
	}
	
	var viewWillDisappear: Driver<Void> {
		return sentMessage(#selector(base.viewWillDisappear))
			.map { _ in }
			.asDriver(onErrorJustReturn: ())
	}
	
	var viewDidDisappear: Driver<Void> {
		return sentMessage(#selector(base.viewDidDisappear))
			.map { _ in }
			.asDriver(onErrorJustReturn: ())
	}
}
