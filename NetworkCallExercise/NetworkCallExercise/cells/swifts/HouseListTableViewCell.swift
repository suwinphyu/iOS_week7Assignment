//
//  HouseListTableViewCell.swift
//  NetworkCallExercise
//
//  Created by Su Win Phyu on 9/16/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit
import SDWebImage


class HouseListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblBedRooms: UILabel!
    @IBOutlet weak var lblSquarFeet: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var houseImgView: UIImageView!
    @IBOutlet weak var houseCardView: CardView!
    
    
    var delegate : HouseDetailsActionDelegate?
    
    var mData : HouseVO? {
        didSet{
            if let house = mData {
            houseImgView.sd_setImage(with: URL(string: house.houseImageUrl ?? ""), placeholderImage: UIImage(named: "placeholder"))
               lblPrice.text = "\(house.price ?? 0 )"
                lblAddress.text = house.address
                lblBedRooms.text = "4 BedRooms"
                lblSquarFeet.text = "\(house.squareFeet ?? 0 )sqft"
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        initGestureRecognizer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initGestureRecognizer(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickDetails))
        houseCardView.isUserInteractionEnabled = true
        houseCardView.addGestureRecognizer(tapGesture)
    }
    
    @objc func onClickDetails(){
        delegate?.onClickDetails(data: mData!)
    }
}
