//
//  ExploreShopCell.swift
//  ThingsMatcher
//
//  Created by A1398 on 27/05/2021.
//

import UIKit

class ExploreShopCell: UICollectionViewCell {

    @IBOutlet weak var vubg: UIView!
    
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        vubg.slightRound()
        img.slightRound()
        addDropShadow()
    }

}
