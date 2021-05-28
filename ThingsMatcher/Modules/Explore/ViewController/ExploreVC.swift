//
//  HomeVC.swift
//  ThingsMatcher
//
//  Created by Nasir Khan on 11/05/2021.
//

import UIKit

class ExploreVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var vuSearch: UIView!
    @IBOutlet weak var vuSecond: UIView!
    @IBOutlet weak var vuLocation: UIView!
    @IBOutlet weak var vuNotification: UIView!
    @IBOutlet weak var table: UITableView!
    
    var exploreItems = [ExploreModel]()
    var allExploreItems = [ExploreModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vuSearch.slightRound()
        vuNotification.slightRound()
        vuSecond.addDropShadow()
        
        exploreItems = [
            ExploreModel(cellType: .header),
            ExploreModel(cellType: .categories),
            ExploreModel(cellType: .shops),
            ExploreModel(cellType: .serviceShops),
            
        ]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exploreItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = exploreItems[indexPath.row]
        
        switch item.cellType {
        case .header:
            return UITableView.automaticDimension
        case .categories:
            return 30
        case .shops:
            return 250
        case .serviceShops:
            return 280 + 100
        default:
            return 400
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = exploreItems[indexPath.row]
        
        switch item.cellType {
        case .header:
            let cell  = tableView.dequeueReusableCell(withIdentifier: "ExploreHelpCell", for: indexPath) as! ExploreHelpCell
            DispatchQueue.main.async {
                cell.selectionStyle = .none
                cell.lblHeading?.text = "Hi Nasir,"
            }
            return cell
        case .categories:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreHeaderCell", for: indexPath) as! ExploreHeaderCell
            DispatchQueue.main.async {
                cell.selectionStyle = .none
                cell.collection.delegate = self
                cell.collection.dataSource = self
                cell.collection.tag = indexPath.row + 100
                cell.collection.reloadData()
            }
            return cell
        case .shops, .serviceShops:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreListingCell", for: indexPath) as! ExploreListingCell
            DispatchQueue.main.async {
                cell.selectionStyle = .none
                switch item.cellType {
                case .shops: cell.title.text = "Near by Shops"
                default: cell.title.text = "Near by Services"
                }
                cell.btnViewAll.isHidden = true
                cell.collection.delegate = self
                cell.collection.dataSource = self
                cell.collection.tag = indexPath.row + 100
                cell.collection.reloadData()
                cell.viewallWidth.constant = 120
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreListingCell", for: indexPath) as! ExploreListingCell
            DispatchQueue.main.async {
                cell.selectionStyle = .none
                cell.title.text = "Categories"
                cell.btnViewAll.isHidden = true
                
                cell.collection.delegate = self
                cell.collection.dataSource = self
                cell.collection.tag = indexPath.row + 100
                cell.collection.reloadData()
                cell.viewallWidth.constant = 120
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if exploreItems.count > 4 {
            if indexPath.row == exploreItems.count - 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    if tableView.visibleCells.contains(cell) {
//                        self.callServces()
                    }
                }
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tag = collectionView.tag - 100
        let item = exploreItems[tag]
        
        switch item.cellType {
        case .categories:
            return CGSize(width: 100, height: 28)
        case .shops:
            return CGSize(width: 330, height: 150)
        case .serviceShops:
            return CGSize(width: 280, height: 280)
        default:
             return CGSize(width: 236, height: 198)
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let tag = collectionView.tag - 100
        if tag < 0 || tag >= exploreItems.count{
            return 0
        }
        let item = exploreItems[tag]
        
        switch item.cellType {
        case .categories, .shops, .serviceShops: return item.categories.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let tag = collectionView.tag - 100
        let item = exploreItems[tag]
        
        switch item.cellType {
        case .categories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCategoryCell", for: indexPath) as! ExploreCategoryCell
            cell.makeSelected(isSelected: indexPath.row == 0)
            cell.vuLbl.text = item.categories[indexPath.row]
            return cell
        case .shops:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreShopCell", for: indexPath) as! ExploreShopCell
            cell.img.image = UIImage(named: "store")
            return cell
        case .serviceShops:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreServiceShopCell", for: indexPath) as! ExploreServiceShopCell
            cell.imgbg.image = UIImage(named: "store")
            cell.imgIcon.image = UIImage(named: "store")
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tag = collectionView.tag - 100
        let item = exploreItems[tag]
        
        switch item.cellType {
        case .categories:
            break
        default:
            break
        }
    }
    

}
