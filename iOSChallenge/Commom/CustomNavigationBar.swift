//
//  CustomNavigationBar.swift
//  iOSChallenge
//
//  Created by Mac on 07/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit


class CustomNavigationBar: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStyle(for: topViewController)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        configureStyle(for: topViewController)    }
    
    
}


protocol CustomNavigationControllerStylable {
    var customNavigationControllerStyle: CustomNavigationControllerStyle? {get}
}

extension CustomNavigationBar {
    fileprivate func configureStyle(for viewController: UIViewController?) {
        if let stylableViewController = viewController as? CustomNavigationControllerStylable, let style = stylableViewController.customNavigationControllerStyle {
            setNavigationBarHidden(style.isBarHidden, animated: style.shouldAnimateStyleChanges)
            navigationBar.barTintColor = style.barTintColor
            navigationBar.tintColor = style.tintColor
            UIApplication.shared.statusBarStyle = style.statusBarStyle
            navigationBar.shadowImage = style.shadowImage
            navigationBar.setBackgroundImage(style.backgroundImage, for: .default)
            navigationBar.isTranslucent = style.isTranslucent
            navigationBar.titleTextAttributes = style.titleTextAttributes
            setNeedsStatusBarAppearanceUpdate()
        }
    }
}
