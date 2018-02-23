//
//  ViewController.swift
//  ScoopInterview
//
//  Created by Luke Solomon on 2/22/18.
//  Copyright © 2018 Luke Solomon. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        label.text = ""
        self.activityIndicator.startAnimating()
        
        Alamofire.request("https://api.takescoop.com/system/info").responseJSON { (data) -> Void in
            let json = JSON(data.result.value)
            let resData = Response.init(json: json)
            
            DispatchQueue.main.async(execute: {
                self.activityIndicator.isHidden = true
                self.label.text = "\(resData.flag)"
            })
        }
    }
    
}

