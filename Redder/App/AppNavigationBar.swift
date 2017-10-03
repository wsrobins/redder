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
		style()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	private func style() {
		tintColor = .black
		isTranslucent = false
		shadowImage = UIImage()
		shadow(depth: .shallow)
	}
}
