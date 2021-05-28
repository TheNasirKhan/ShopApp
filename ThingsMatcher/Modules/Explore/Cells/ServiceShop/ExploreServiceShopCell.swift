//
//  ExploreServiceShopCell.swift
//  ThingsMatcher
//
//  Created by A1398 on 28/05/2021.
//

import UIKit

class ExploreServiceShopCell: UICollectionViewCell {
    
    @IBOutlet weak var vubg: UIView!
    @IBOutlet weak var imgbg: UIImageView!
    @IBOutlet weak var imgIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vubg.slightRound()
        imgbg.slightRound()
        imgIcon.slightRound()
        imgIcon.layer.borderWidth = 0.5
        imgIcon.layer.borderColor = UIColor.white.cgColor
        addDropShadow()
    }

}
