//
//  AppDelegate.swift
//  Redder
//
//  Created by William Robinson on 9/23/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		self.window = UIWindow()
		self.window?.rootViewController = AppNavigationController()
		self.window?.makeKeyAndVisible()
		return true
	}
}

