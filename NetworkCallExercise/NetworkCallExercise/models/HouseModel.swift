//
//  HouseModel.swift
//  NetworkCallExercise
//
//  Created by Su Win Phyu on 9/16/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
import SwiftyJSON

class HouseModel{
    var houseData : [HouseVO] = []
    var houseResponse : HouseResponse = HouseResponse()
    
    private static var sharedHouseModel : HouseModel = {
        let houseModel = HouseModel()
        return houseModel
    }()
    
    
    class func shared() -> HouseModel{
        return sharedHouseModel
    }
    
    func apiGetHouseList(success: @escaping() -> Void ,
                         failure : @escaping(String) -> Void){
        NetworkClient.shared().getData(route: SharedConstants.ApiRoute.GET_HOUSE_LIST, headers: [:], parameters: [:], success: { (data) in
            guard let data = data as? Data else {return}
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.houseResponse = try
                decoder.decode(HouseResponse.self, from: data)               
                success()
            }catch let jsonErr {
                failure(jsonErr.localizedDescription)
                
            }
        }) { (err) in
            failure(err)
        }
    }
    
}
