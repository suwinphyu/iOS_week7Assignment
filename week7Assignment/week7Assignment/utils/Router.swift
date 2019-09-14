//
//  Router.swift
//  week7Assignment
//
//  Created by Su Win Phyu on 9/14/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func navigateToHouseDetailViewController(data: HouseDetailVO?) {
        
        let storyboard = UIStoryboard(name: SharedConstants.Storyboard.SB_MAIN, bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: DetailHousingViewController.identifier) as? DetailHousingViewController
        vc?.mData = data
        
        if let viewController = vc {
            self.present(viewController, animated: true, completion: nil)
        }
    }
}
