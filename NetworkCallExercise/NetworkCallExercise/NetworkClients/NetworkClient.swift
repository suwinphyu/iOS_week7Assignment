//
//  NetworkClient.swift
//  NetworkCallExercise
//
//  Created by Su Win Phyu on 9/16/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class NetworkClient {
    private let baseUrl : String
    
    private init(baseUrl : String){
        self.baseUrl = baseUrl
    }
    
    private static var sharedNetworkClient : NetworkClient = {
        let url = SharedConstants.BASE_URL
        return NetworkClient(baseUrl: url)
    }()
    
    class func shared() -> NetworkClient {
        return sharedNetworkClient
    }
    
    public func getData(route: String,
                        headers :HTTPHeaders,
                        parameters : Parameters,
                        success : @escaping (Any) -> Void ,
                        failure : @escaping(String) -> Void){
        Alamofire.request(SharedConstants.BASE_URL + route ,
                          method: .get,
                          parameters: parameters,
                          headers: headers).responseData { (response) in
                            guard let data = response.result.value else {return}
                            
                            switch response.result{
                            case .success : do{
                                                let decoder = JSONDecoder()
                                                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                                                    let baseResponse = try decoder.decode(BaseResponse.self, from: data)
                                
                                if baseResponse.isResponseOK(){
                                    let json = JSON(response.result.value!)
                                    let data = json["data"] // key from json
                                    success(data)
                                }else{
                                    failure("Error")
                                }
                                
                                                }catch let jsonErr {failure(jsonErr.localizedDescription)}
                                                    success(data)
                                                    break
                            case .failure(let err) : failure(err.localizedDescription)
                                                    break
                            }
        }
    }
}
