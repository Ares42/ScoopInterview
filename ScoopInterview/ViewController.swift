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
    
    //MARK: IBOutlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupViews()
        setupNetwork()
    }
    
    //MARK: Setup Functions
    func setupViews() {
        label.text = ""
        self.activityIndicator.startAnimating()
    }
    
    func setupNetwork() {
        NetworkHelper.sharedInstance.getBoolFromServer(completion: { response in
            DispatchQueue.main.async(execute: {
                self.activityIndicator.isHidden = true
                self.label.text = "\(response.flag)"
            })
        })
    }
    
}

