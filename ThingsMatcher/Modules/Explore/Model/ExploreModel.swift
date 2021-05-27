//
//  ExploreModel.swift
//  KrankIOS
//
//  Created by Apple on 21/11/2019.
//  Copyright © 2019 Syed Ahmed Fraz Zaki. All rights reserved.
//

import UIKit
import SwiftyJSON

enum ExploreCellType {
    case header
    case categories
    case shops
    case serviceShops
    case recommendedProducts
    case recommendedSeller
    case product
    case deals
    case empty
}

class ExploreModel {
    
    var cellType : ExploreCellType
    var title: String?
    var categories = ["All","Shops","Service","Product"]
    
    init(cellType: ExploreCellType, title: String? = nil) {
        self.cellType = cellType
        self.title = title
    }
    
    init(model: ExploreModel) {
        
        self.cellType = model.cellType
        
    }
}
