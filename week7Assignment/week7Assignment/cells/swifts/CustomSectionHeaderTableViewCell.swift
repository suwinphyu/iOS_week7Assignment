//
//  CustomSectionHeaderTableViewCell.swift
//  week7Assignment
//
//  Created by Su Win Phyu on 9/14/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class CustomSectionHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var menuListCollectionView: UICollectionView!
    var menulist : [String] = ["Top Collection" , "Near Me " , "Low to high", "high to low" , "Discount Item"]
    //To calculate flowlayout
    let numberOfItemsPerRow : CGFloat = 3
    let spacing : CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        setupFlowLayout()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setupCollectionView(){
        menuListCollectionView.delegate = self
        menuListCollectionView.dataSource = self
        menuListCollectionView.registerForItem(strID: String(describing: MenuListCollectionViewCell.self))
    }
    
    func setupFlowLayout(){
        //Flowlayout
        let totalPadding : CGFloat = numberOfItemsPerRow * spacing
        let itemWidth = (menuListCollectionView.frame.width - totalPadding) / numberOfItemsPerRow
        let layout = menuListCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 2
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
    
}

extension CustomSectionHeaderTableViewCell : UICollectionViewDelegate{}

extension CustomSectionHeaderTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menulist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MenuListCollectionViewCell.self), for: indexPath) as! MenuListCollectionViewCell
        item.mData = menulist[indexPath.row]
        return item
    }
}
