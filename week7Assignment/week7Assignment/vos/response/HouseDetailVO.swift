//
//  HouseDetailVO.swift
//  week7Assignment
//
//  Created by Su Win Phyu on 9/14/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
import UIKit

struct HouseDetailVO : Codable {
    
    var id: Int?
    var houseImageUrl: String?
    var name: String?
    var description: String?
    var price: Int?
    var address: String?
    var squareFeet: Int?
    var latitude: Double?
    var longitude: Double?
}
