//
//  NetworkHandler.swift
//  ScoopInterview
//
//  Created by Luke Solomon on 2/22/18.
//  Copyright © 2018 Luke Solomon. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct Response {
    var flag:Bool
    
    init(json:JSON) {
        self.flag = json["data"]["newVersion"]["isAvailable"].boolValue
    }
    
}


struct NetworkHelper {
    static let sharedInstance = NetworkHelper()
    
    func getBoolFromServer(completion: @escaping(Response) -> Void) {
        let url = "https://api.takescoop.com/system/info"
        
        Alamofire.request(url).responseJSON { (response) in
            
            
            switch response.result{
            case .success:
                if let value = response.result.value {
                    let responseObject = Response.init(json: JSON(value))
                    
                    completion(responseObject)
                    
                }
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
    
    
    
}
