//
//  HouseResponse.swift
//  week7Assignment
//
//  Created by Su Win Phyu on 9/14/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
struct HouseResponse : Codable {
    var code : Int?
    var message : String?
    var data : [HouseVO]?
    
    enum CodingKeys: String, CodingKey {
        
        case code = "code"
        case message = "message"
        case data = "data"
    }
    
    
}


