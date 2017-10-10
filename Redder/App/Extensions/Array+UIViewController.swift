//
//  Array+UIViewController.swift
//  Redder
//
//  Created by William Robinson on 10/8/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import UIKit

extension Array where Element: UIViewController {
	
	func contains<T: UIViewController>(type: T.Type) -> Bool {
		return self
			.filter { $0 is T }
			.isEmpty
	}
}
