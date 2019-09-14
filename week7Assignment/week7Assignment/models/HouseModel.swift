//
//  HouseModel.swift
//  week7Assignment
//
//  Created by Su Win Phyu on 9/14/19.
//  Copyright © 2019 swp. All rights reserved.
//


import Foundation

class HouseModel {
    
    class func shared()-> HouseModel {
        return sharedHouseModel
    }
    
    private static var sharedHouseModel: HouseModel = {
        let houseModel = HouseModel()
        return houseModel
    }()
    
    var houseResponse: HotelResponse = HotelResponse()
    
    func apiGetHouseList(success: @escaping ()-> Void, failure: @escaping (String)-> Void) {
        NetworkClient.shared().getData(success: { (data) in
            guard let data = data as? Data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self.houseResponse = try
                    decoder.decode(HotelResponse.self, from: data)
                success()
            } catch let jsonErr {
                failure(jsonErr.localizedDescription)
            }
        }) { (err) in
            failure(err)
        }
    }
}
