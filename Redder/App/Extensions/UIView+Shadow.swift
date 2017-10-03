//
//  UIView+Shadow.swift
//  Redder
//
//  Created by William Robinson on 9/28/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import UIKit

extension UIView {
	
	enum ShadowDepth {
		case shallow
		case deep
	}
	
	func shadow(depth: ShadowDepth) {
		switch depth {
		case .shallow:
			layer.shadowOpacity = 0.22
			layer.shadowRadius = 2
			layer.shadowOffset = CGSize(width: 0, height: 1)
		case .deep:
			layer.shadowOpacity = 0.3
			layer.shadowRadius = 4
			layer.shadowOffset = CGSize(width: 0, height: 4)
		}
		
	}
}
