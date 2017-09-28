//
//  UIView+Shadow.swift
//  Redder
//
//  Created by William Robinson on 9/28/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import UIKit

extension UIView {
	
	func shadow() {
		layer.shadowOpacity = 0.22
		layer.shadowRadius = 2
		layer.shadowOffset = CGSize(width: 0, height: 1)
	}
}
