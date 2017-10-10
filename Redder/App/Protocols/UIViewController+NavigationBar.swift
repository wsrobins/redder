//
//  UIViewController+NavigationBar.swift
//  Redder
//
//  Created by William Robinson on 10/7/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import UIKit

extension UIViewController {
	
	func showNavigationBar(animated: Bool) {
		guard let navigationController = navigationController, navigationController.isNavigationBarHidden else { return }
		navigationController.setNavigationBarHidden(false, animated: animated)
	}
	
	func hideNavigationBar(animated: Bool) {
		guard let navigationController = navigationController, !navigationController.isNavigationBarHidden else { return }
		navigationController.setNavigationBarHidden(true, animated: animated)
	}
}
