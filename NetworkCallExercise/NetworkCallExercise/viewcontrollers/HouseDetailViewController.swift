//
//  HouseDetailViewController.swift
//  NetworkCallExercise
//
//  Created by Su Win Phyu on 9/17/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    static let identifier = "HouseDetailViewController"
    var mData : HouseVO?
    
    @IBOutlet weak var houseDetailImageView: UIImageView!
    
    @IBOutlet weak var lblBedRoom: UILabel!
    @IBOutlet weak var lblSquareFeet: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblReview: UILabel!
    @IBOutlet weak var lblFavourite: UILabel!
    @IBOutlet weak var btnSeePhoto: UIButton!
    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var lblHouseDescription: UILabel!
    @IBOutlet weak var lblHouseName: UILabel!    
    @IBOutlet weak var btnAddFavourite: UIButton!
    @IBOutlet weak var btnBookNow: UIButton!
    
    @IBOutlet weak var houseDetailSearch: UISearchBar!
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        showData()
        
    }
    
    func showData(){
        houseDetailImageView.sd_setImage(with: URL(string: mData?.houseImageUrl ?? "" ) , placeholderImage: UIImage(named: "placeholder"))
        lblPrice.text = "\(mData?.price ?? 0)"
        lblAddress.text = mData?.address
        lblSquareFeet.text = "\(mData?.squareFeet ?? 0) sqft"
        lblFavourite.text = "324 Favorites"
        lblBedRoom.text = "4 Bedrooms"
        lblReview.text = "23 Reviews"
        lblHouseName.text = mData?.name?.toMMFont() ?? "Single Family House"
        lblHouseDescription.text = mData?.description?.toMMFont() ?? "This two storey house for rent in bahan township accommodates 2 master bedrooms and 1 single room with 3 bathrooms. At 3000 square feet of house size and 4000 sqft of land size this residence is suitable for a family as a home at Prime area."
        
    }
    
    


}
