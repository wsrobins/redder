//
//  Bag.swift
//  Redder
//
//  Created by William Robinson on 9/30/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxSwift

protocol Bag: class {
	var bag: DisposeBag { get set }
}

extension Bag where Self: AnyObject {
	
	var bag: DisposeBag {
		get {
			if let bag = objc_getAssociatedObject(self, &AssociatedKeys.bag) as? DisposeBag {
				return bag
			}
			let bag = DisposeBag()
			self.bag = bag
			return bag
		}
		set {
			objc_setAssociatedObject(self, &AssociatedKeys.bag, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}
}

private struct AssociatedKeys {
	static var bag: UInt8 = 0
}
