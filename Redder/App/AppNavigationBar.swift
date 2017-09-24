//
//  AppNavigationBar.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import SnapKit
import UIKit

class AppNavigationBar: UINavigationBar {
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		self.isTranslucent = false
		self.shadowImage = UIImage()
		self.layer.shadowOpacity = 0.2
		self.layer.shadowRadius = 2
		self.layer.shadowOffset = CGSize(width: 0.5, height: 1)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
}
