//
//  AppDelegate.swift
//  ASDKPagerViewControllerLayoutIssue
//
//  Created by Adlai Holler on 2/22/16.
//  Copyright © 2016 adlai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		let window = UIWindow(frame: UIScreen.mainScreen().bounds)
		self.window = window
		window.rootViewController = GuideViewController(guide: .test)
		window.makeKeyAndVisible()
		// Override point for customization after application launch.
		return true
	}

}

