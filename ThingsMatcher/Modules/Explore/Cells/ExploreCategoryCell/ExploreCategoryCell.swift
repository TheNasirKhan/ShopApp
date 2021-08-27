//
//  ExploreCategoryCell.swift
//  ThingsMatcher
//
//  Created by Nasir Khan on 18/05/2021.
//

import UIKit

class ExploreCategoryCell: UICollectionViewCell {

    @IBOutlet weak var vubg: UIView!
    @IBOutlet weak var vuLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vubg.layoutIfNeeded()
        vubg.layoutSubviews()
        vubg.slightRound()
        addDropShadow()
    }
    
    func makeSelected(isSelected: Bool) {
        vubg.backgroundColor = isSelected ? .AppDarkGray : .clear
        vuLbl.textColor = isSelected ? .white : .AppDarkGray
    }

}
