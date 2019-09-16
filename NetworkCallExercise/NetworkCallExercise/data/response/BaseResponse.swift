//
//  BaseResponse.swift
//  NetworkCallExercise
//
//  Created by Su Win Phyu on 9/16/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation

struct BaseResponse: Codable {
    var code: Int?
    var message: String?
    
    func isResponseOK() -> Bool {
        if let code = code, code > 0 {
            if code == 200 {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    
}
