//
//  ExploreHeaderCell.swift
//  KrankIOS
//
//  Created by Apple on 19/11/2019.
//  Copyright © 2019 Syed Ahmed Fraz Zaki. All rights reserved.
//

import UIKit

class ExploreHeaderCell: UITableViewCell {

    @IBOutlet weak var collection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let cells = ["ExploreHeaderItemCell", "ExploreCategoryCell"]
        
        for cell in cells {
            let nib = UINib(nibName: cell, bundle: nil)
            collection.register(nib, forCellWithReuseIdentifier: cell)
        }
        
    }
    
    func reloadCollection() {
        self.collection.reloadData()
    }
    

}
