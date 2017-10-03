//
//  UIViewController+HideNavigationBar.swift
//  Redder
//
//  Created by William Robinson on 9/29/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxSwift

protocol HideNavigationBar: class {
	func hideNavigationBar(with observable: Observable<Bool>)
}

extension HideNavigationBar where Self: UIViewController, Self: Bag  {
	
	func hideNavigationBar(with observable: Observable<Bool>) {
		observable
			.filter { [unowned self] _ in self.navigationController?.isNavigationBarHidden == false }
			.bind { [unowned self] animated in self.navigationController?.setNavigationBarHidden(true, animated: animated) }
			.disposed(by: bag)
	}
}
