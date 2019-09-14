//
//  BaseViewController.swift
//  The Movie App
//
//  Created by Su Win Phyu on 9/8/19.
//  Copyright © 2019 Ye Ko Ko Htet. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
}
extension BaseViewController : NVActivityIndicatorViewable {
    func showProgress(message : String){
        startAnimating(CGSize(width: 30, height: 30), message: message,messageFont: nil, type :NVActivityIndicatorType.lineScalePulseOut)
    }
    
    func hideProgress(){
        stopAnimating()
    }
}


