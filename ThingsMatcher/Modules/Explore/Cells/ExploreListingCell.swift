//
//  ExploreListingCell.swift
//  KrankIOS
//
//  Created by Apple on 19/11/2019.
//  Copyright © 2019 Syed Ahmed Fraz Zaki. All rights reserved.
//

import UIKit

class ExploreListingCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var btnViewAll: UIButton!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var lblSelectedCount: UILabel?
    @IBOutlet weak var collectionHeight: NSLayoutConstraint?
    @IBOutlet weak var viewallWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.autoresizingMask = [UIView.AutoresizingMask.flexibleHeight]
        
        for item in ["ExploreAuctionItemCell", "ExploreItemCell", "ExplorePeopleCell", "TopTabCell", "DBCell"] {
            let nib = UINib(nibName: item, bundle: nil)
            collection.register(nib, forCellWithReuseIdentifier: item)
        }
        
    }

}
