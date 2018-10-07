//
//  NetworkManager.swift
//  iOSChallenge
//
//  Created by Mac on 07/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    class func isConnectedToInternet(controller: UIViewController) -> Bool {
        let networkManager = NetworkReachabilityManager()!
        let isConnectedToInternet = networkManager.isReachable
        showNoInternetConnectionMsg(isConnected: isConnectedToInternet, controller: controller)
        return isConnectedToInternet
    }
    
    fileprivate class func showNoInternetConnectionMsg(isConnected: Bool, controller: UIViewController) {
        if !isConnected {
            AlertManager.createOneButtonAlert(controller: controller, type: .noInternet )
        }
    }
}
