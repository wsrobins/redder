//
//  UIViewController+ShowNavigationBar.swift
//  Redder
//
//  Created by William Robinson on 9/29/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxSwift

protocol ShowNavigationBar: class {
	func showNavigationBar(with observable: Observable<Bool>)
}

extension ShowNavigationBar where Self: UIViewController, Self: Bag {
	
	func showNavigationBar(with observable: Observable<Bool>) {
		observable
			.filter { [unowned self] _ in self.navigationController?.isNavigationBarHidden == true }
			.bind { [unowned self] animated in self.navigationController?.setNavigationBarHidden(false, animated: animated) }
			.disposed(by: bag)
	}
}
