//
//  AppDelegate.swift
//  EcommerceCart
//
//  Created by Avinash on 05/09/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            // Customize the global navigation bar appearance
            let appearance = UINavigationBarAppearance()
            
            // Set the background color for the navigation bar
            appearance.backgroundColor = UIColor.accent
            
            // Set the text attributes for title and large title (white text)
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
            ]
            appearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 30)
            ]
            
            // Apply the appearance globally to all UINavigationBars
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
            // Set bar button tint color to white (for buttons and back button)
            UINavigationBar.appearance().tintColor = UIColor.white
            
            // Set status bar style to light content
           
            if #available(iOS 13.0, *) {
                if let statusBarManager = window?.windowScene?.statusBarManager {
                    // Get the status bar frame directly, no need for optional binding
                    let statusBarFrame = statusBarManager.statusBarFrame
                    let statusBarView = UIView(frame: statusBarFrame)
                    statusBarView.backgroundColor = UIColor.accent
                    window?.addSubview(statusBarView)
                }
            }else {
                UIApplication.shared.statusBarStyle = .lightContent
            }
            
            return true
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

