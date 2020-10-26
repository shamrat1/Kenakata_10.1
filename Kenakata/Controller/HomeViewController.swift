//
//  HomeViewController.swift
//  Kenakata
//
//  Created by Md Sifat on 6/10/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD
import AlamofireImage


class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBarHome: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let allProductUrl = "https://afiqsouq.com//wp-json/wc/v2/products?consumer_key=ck_62eed78870531071b419c0dca0b1dd9acf277227&consumer_secret=cs_a5b646ab7513867890dd63f2c504af98f00cee53"
    var allProduct : [AllProduct] = []
    let header = ["Features..", "New Arivals.."]
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson()
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.addCustomBorderLine()
        addCustomItem()
        
        
    }
    
    func getJson() {
        Alamofire.request(allProductUrl).responseJSON { (myresponse) in
            switch myresponse.result{
            case .success:
                if let json = myresponse.result.value as? [[String: Any]] {

                    for dic in json{
                            let allData = AllProduct.init(json: dic)
                            self.allProduct.append(allData)
                    }
                    print(self.allProduct.count)
                }
                
            case let .failure(error):
                print(error)
                print("Wrong")
            }
        }
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return header.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomHomeTableViewCell
        cell.headerLbl.text = "\(header[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ccell = collectionView.dequeueReusableCell(withReuseIdentifier: "ccell", for: indexPath) as! CustomHomeCollectionViewCell
        
        return ccell
    }
}





