//
//  AppDelegate.swift
//  MagazineViewer
//
//  Created by Hans Knöchel on 06.06.18.
//  Copyright © 2018 Hans Knöchel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
  }
  
  func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    if userActivity.activityType == NSUserActivity.viewMagazineActivityType {
      handleUserActivity()
      return true
    }

    // TODO: Implement INIntent handler as well
  
    return false
  }

  private func handleUserActivity() {
    guard let window = window,
      let rootViewController = window.rootViewController as? UINavigationController,
      let magazinesViewController = rootViewController.viewControllers.first as? MagazinesTableViewController else {
        return print("Error: Failed to prepare activity")
    }

    magazinesViewController.performSegue(withIdentifier: MagazinesTableViewController.MagazineSegues.detail.rawValue, sender: nil)
  }
}
