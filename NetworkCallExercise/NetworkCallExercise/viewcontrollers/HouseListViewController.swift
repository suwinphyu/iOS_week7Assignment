//
//  HouseListViewController.swift
//  NetworkCallExercise
//
//  Created by Su Win Phyu on 9/16/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class HouseListViewController: BaseViewController {
    
    static let identifier = "HouseListViewController"
    var refreshControl = UIRefreshControl()
    var HouseData : [HouseVO]?
    
    @IBOutlet weak var houseListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        houseListTableView.separatorStyle = .none
        getHouseList()
        refreshScreen()
        setupTableView()
        
        
        
    }
    func refreshScreen(){
        refreshControl.addTarget(self,action: #selector(onRefresh),for: .valueChanged)
        houseListTableView.addSubview(refreshControl)
    }
    @objc func onRefresh(){
        getHouseList()
    }
    
    func setupTableView(){
        houseListTableView.delegate = self
        houseListTableView.dataSource = self
        houseListTableView.registerForCell(strID: String(describing: HouseListTableViewCell.self))
        houseListTableView.registerForCell(strID: String(describing: CustomSectionHeaderTableViewCell.self))
    }
    
    func getHouseList(){
        self.showProgress(message: "Loading..")
        self.refreshControl.beginRefreshing()
        HouseModel.shared().apiGetHouseList(success: {
            self.hideProgress()
            self.refreshControl.endRefreshing()
            
            //reload data
            self.houseListTableView.reloadData()
        }) { (err) in
            self.hideProgress()
            self.refreshControl.endRefreshing()
            print(err)
        }
        
    }
    
}

extension HouseListViewController : UITableViewDelegate{
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
}

extension HouseListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HouseModel.self.shared().houseResponse.data?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HouseListTableViewCell.self), for: indexPath) as! HouseListTableViewCell
        cell.mData = HouseModel.self.shared().houseResponse.data?[indexPath.row]
        cell.delegate = self
        return cell
    }
}


extension HouseListViewController : HouseDetailsActionDelegate {
    func onClickDetails(data: HouseVO) {
   
        let storyboard = UIStoryboard(name: SharedConstants.Storyboard.SB_MAIN, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: HouseDetailViewController.identifier) as! HouseDetailViewController
        vc.mData = data
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
