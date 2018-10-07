//
//  AlertManager.swift
//  iOSChallenge
//
//  Created by Mac on 07/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit

enum AlertTypes {
    case error, warning, noInternet
}


class AlertManager {
    
    class func createOneButtonAlert(controller: UIViewController, type: AlertTypes) {
        let info = alertSetup(type: type)
        let title = info.0
        let message = info.1
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    class func alertSetup(type: AlertTypes) -> (String, String) {
        switch type {
        case .error:
           return ("Something unexpected happended","An error ocurred, please try again later.")
        case .noInternet:
            return ("You're offline","No internet signal was found.")
        case .warning:
            return ("","")
        default:
            return ("","")
        }
    }
    
}
