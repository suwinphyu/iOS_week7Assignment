//
//  MenuListCollectionViewCell.swift
//  week7Assignment
//
//  Created by Su Win Phyu on 9/14/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class MenuListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblMenuTitle: UILabel!
    
    var mData:String! {
        didSet{
            lblMenuTitle.text = mData
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
