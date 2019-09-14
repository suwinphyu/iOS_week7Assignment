//
//  ForYouViewController.swift
//  week7Assignment
//
//  Created by Su Win Phyu on 9/14/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class ForYouViewController: BaseViewController {

    @IBOutlet weak var houseTableView: UITableView!
    var houseData: [HouseVO]?
    
    var refreshControl = UIRefreshControl()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        houseTableView.separatorStyle = .none
        
        //network call
        getHouseList()

        
        //pull refresh
        refreshControl.addTarget(self, action: #selector(onRefresh), for:.valueChanged)
        houseTableView.addSubview(refreshControl)

        
    }
    @objc func onRefresh(){
        getHouseList()
    }
    
    private func getHouseList() {
        //loading
        self.showProgress(message: "Loading...")
        
        HouseModel.shared().apiGetHouseList(success: {
            self.hideProgress()
           // self.houseData = HouseModel.shared().houseResponse
            //self.houseData = HouseModel.apiGetHouseList(HouseModel)
            self.houseTableView.reloadData()
            self.refreshControl.endRefreshing()
        }) { (err) in
            self.hideProgress()
            self.refreshControl.endRefreshing()
            print(err)
        }
    }

    func setupTableView(){
        houseTableView.delegate = self
        houseTableView.dataSource = self
        houseTableView.registerForCell(strID: String(describing: CustomSectionHeaderTableViewCell.self))
        houseTableView.registerForCell(strID: String(describing: HousingTableViewCell.self))
    }
  

}

extension ForYouViewController : UITableViewDelegate{
    //Header view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomSectionHeaderTableViewCell.self)) as! CustomSectionHeaderTableViewCell
        return cell
        
        
    }
    
    //Header view
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomSectionHeaderTableViewCell.self))
        return cell?.bounds.height ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToHouseDetailViewController(data: houseData?[indexPath.row] ?? HouseVO())
    }
}

extension ForYouViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houseData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HousingTableViewCell.self), for: indexPath) as! HousingTableViewCell
       // cell.movie = HouseModel.shared().houseResponse.results?[indexPath.row] ?? HouseVO()
      //  cell.delegate = self
        
       cell.mData = houseData?[indexPath.row]
        return cell
    }
}
