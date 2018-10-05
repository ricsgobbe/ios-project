//
//  StringExtension.swift
//  CodeChallenge
//
//  Created by Mac on 02/09/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation


extension String {
    func convertDateFormater() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: self) else {
            return ""
        }
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return  dateFormatter.string(from: date)
        
    }
}
