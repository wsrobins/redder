//
//  UIView+ReuseIdentifier.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import UIKit

extension UIView {
	
	static var reuseIdentifier: String {
		return String(describing: type(of: self))
	}
}
