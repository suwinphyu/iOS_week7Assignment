//
//  HouseResponse.swift
//  week7Assignment
//
//  Created by Su Win Phyu on 9/14/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation

struct HotelResponse : Codable{
    var code: Int?
    var message: String?
    var data: [HouseDetailVO]?
}
