//
//  DetailHousingViewController.swift
//  week7Assignment
//
//  Created by Su Win Phyu on 9/14/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit
import SDWebImage

class DetailHousingViewController: UIViewController {

    static let identifier = "DetailHousingViewController"
    
    var mData: HouseDetailVO?
    
    
    @IBOutlet weak var btnBookNow: UIButton!   
    @IBOutlet weak var btnAddFavourite: UIButton!
    @IBOutlet weak var hotelImgView: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSquareFeet: UILabel!
    @IBOutlet weak var lblBedRoom: UILabel!
    @IBOutlet weak var lblFavourite: UILabel!
    @IBOutlet weak var lblReview: UILabel!
    @IBOutlet weak var lblDescription: UITextView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hotelImgView.sd_setImage(with: URL(string: mData?.houseImageUrl ?? ""),                                   placeholderImage: #imageLiteral(resourceName: "img"))
        lblAddress.text = mData?.address
        lblPrice.text = "\(mData?.price)"
        lblSquareFeet.text = "\(mData?.squareFeet)"
        lblBedRoom.text = "4 Bedrooms"
        lblFavourite.text = "324 Favourite"
        lblReview.text = "23 Review"
        lblTitle.text = mData?.name?.toMMFont()
        lblDescription.text = mData?.description?.toMMFont()
        
    }
    

    
  
}
