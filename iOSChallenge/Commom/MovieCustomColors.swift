//
//  MovieCustomColors.swift
//  iOSChallenge
//
//  Created by Mac on 07/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit

enum ColorPalette {
    static let backgroundColor = UIColor(red: 248/255 , green: 248/255 , blue: 248/255 , alpha: 1)
    static let mainColor = UIColor(red: 82/255 , green: 132/255 , blue: 189/255 , alpha: 1)
    static let darkBluePastel = UIColor(red: 68/255 , green: 119/255 , blue: 178/255 , alpha: 1)
    static let gradientLightColor = UIColor(red: 0/255 , green: 0/255 , blue: 0/255 , alpha: 1)
    static let gradientDarkColor = UIColor(red: 0/255 , green: 0/255 , blue: 0/255 , alpha: 0)
}

protocol CustomNavigationControllerStyle {
    var isBarHidden: Bool {get}
    var statusBarStyle: UIStatusBarStyle {get}
    var barTintColor: UIColor? {get}
    var tintColor: UIColor {get}
    var shadowImage: UIImage? {get}
    var backgroundImage: UIImage? {get}
    var isTranslucent: Bool {get}
    var titleTextAttributes: [NSAttributedStringKey: Any]? {get}
    var shouldAnimateStyleChanges: Bool {get}
}

struct MyTaxiCustomNavigationControllerStyle: CustomNavigationControllerStyle {
    var isBarHidden: Bool = false
    var statusBarStyle: UIStatusBarStyle = .lightContent
    var barTintColor: UIColor? = ColorPalette.mainColor
    var tintColor: UIColor = ColorPalette.backgroundColor
    var shadowImage: UIImage? = nil
    var backgroundImage: UIImage? = nil
    var isTranslucent: Bool = false
    var titleTextAttributes: [NSAttributedStringKey : Any]? = [.foregroundColor: UIColor.white]
    var shouldAnimateStyleChanges: Bool = true
}
