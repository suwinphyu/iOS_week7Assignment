//
//  HousingTableViewCell.swift
//  week7Assignment
//
//  Created by Su Win Phyu on 9/14/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit
import SDWebImage

class HousingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var hotelImageView: UIImageView!
    
    @IBOutlet weak var lblPrice: UIButton!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblBedroom: UILabel!
    @IBOutlet weak var lblSquareFeet: UILabel!
    
    var mData: HouseDetailVO? {
        didSet {
         
            let title: Int = mData?.price ?? 0
            lblPrice.setTitle(String(title), for: .normal)
                
            //lblPrice.setTitle("\(mData?.String(describing: mData.price))", for: .normal)
            lblAddress.text = mData?.address ?? "Webmester, london"
            lblSquareFeet.text = "\(mData?.squareFeet)"
            lblBedroom.text = "4 bedrooms"
            hotelImageView.sd_setImage(with: URL(string: mData?.houseImageUrl ?? String(_cocoaString:UIImage(imageLiteralResourceName: "placeholder"))), placeholderImage: UIImage(named: "placeholder"))
                
            
        }
    }
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
         self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
