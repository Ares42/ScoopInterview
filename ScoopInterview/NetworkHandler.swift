//
//  NetworkHandler.swift
//  ScoopInterview
//
//  Created by Luke Solomon on 2/22/18.
//  Copyright © 2018 Luke Solomon. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Response {
    var flag:Bool
    
    init(json:JSON) {
        self.flag = json["data"]["newVersion"]["isAvailable"].boolValue
    }
    
}
