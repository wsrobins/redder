//
//  UIViewController+Rx.swift
//  Redder
//
//  Created by William Robinson on 9/30/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxSwift

extension Reactive where Base: UIViewController {
	
	var viewDidLoad: Observable<Void> {
		return sentMessage(#selector(base.viewDidLoad)).map { _ in }
	}
	
	var viewWillAppear: Observable<Void> {
		return sentMessage(#selector(base.viewWillAppear)).map { _ in }
	}
	
	var viewDidAppear: Observable<Void> {
		return sentMessage(#selector(base.viewDidAppear)).map { _ in }
	}
	
	var viewWillDisappear: Observable<Void> {
		return sentMessage(#selector(base.viewWillDisappear)).map { _ in }
	}
	
	var viewDidDisappear: Observable<Void> {
		return sentMessage(#selector(base.viewDidDisappear)).map { _ in }
	}
}
