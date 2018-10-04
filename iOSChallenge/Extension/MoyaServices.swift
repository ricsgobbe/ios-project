//
//  MoyaServices.swift
//  CodeChallenge
//
//  Created by Mac on 01/09/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
import Alamofire

struct Service<Target: TargetType> {
    
    typealias ResponseCompletion = (Result<JSON>) -> Void
    
    let provider: MoyaProvider<Target>
    
    init(plugins: [PluginType] = []){
        provider = MoyaProvider<Target>(plugins: plugins)
    }
    
    func request(_ target: Target, completion: @escaping ResponseCompletion){
        
        provider.request(target) { (result) in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let json = JSON(data)
                completion(.success(json))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func touch(_ target: Target){
        provider.request(target) { (_) in }
    }
}
