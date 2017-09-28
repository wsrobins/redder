//
//  AppNavigationBar.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import UIKit

class AppNavigationBar: UINavigationBar {
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		tintColor = .black
		isTranslucent = false
		shadowImage = UIImage()
		shadow()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
}
