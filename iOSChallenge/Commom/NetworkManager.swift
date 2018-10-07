//
//  NetworkManager.swift
//  iOSChallenge
//
//  Created by Mac on 07/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    class func isConnectedToInternet() -> Bool {
        let networkManager = NetworkReachabilityManager()!
        return networkManager.isReachable
    }
}
