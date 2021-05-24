//
//  ViewController.swift
//  ThingsMatcher
//
//  Created by Nasir Khan on 27/03/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseFetcher.sharedInstance.addUser(userProfile: "as", completionHandler: {
            
        })
    }


}

