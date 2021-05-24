//
//  TabbarVC.swift
//  My Salah Record
//
//  Created by Nasir Khan on 13/11/2018.
//  Copyright © 2018 Techwisely. All rights reserved.
//

import UIKit

struct TabbarItem {
    var title: String
    var image: String
    var selectedImage: String
    var vcID: String
    var storyboardID: String
}

class TabbarVC: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.selectedIndex = 2
        self.view.backgroundColor = .white
        settingUpTabBarAndInitializingViewControllers()
    }
    
    private func settingUpTabBarAndInitializingViewControllers() {
        
        let tabbarItems = [
            TabbarItem(title: "Explore", image: "ExploreTabbar", selectedImage: "ExploreTabbar", vcID: "ExploreVC", storyboardID: "Home"),
            TabbarItem(title: "Business", image: "businessTabbar", selectedImage: "ExploreTabbar", vcID: "ExploreVC", storyboardID: "Home"),
            TabbarItem(title: "Inbox", image: "inboxTabbar", selectedImage: "ExploreTabbar", vcID: "ExploreVC", storyboardID: "Home"),
            TabbarItem(title: "My Activity", image: "activityTabbar", selectedImage: "ExploreTabbar", vcID: "ExploreVC", storyboardID: "Home"),
            TabbarItem(title: "Account", image: "moreTabbar", selectedImage: "ExploreTabbar", vcID: "ExploreVC", storyboardID: "Home")
        ]
        
        var vcs = [UIViewController]()
        
        for (index,item) in tabbarItems.enumerated() {
            let storyboard = UIStoryboard(name: item.storyboardID, bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: item.vcID)
            let nav = UINavigationController(rootViewController: vc)
            nav.isNavigationBarHidden = true
            let image = UIImage(named: item.image)
            
            let tabbarItem = UITabBarItem(title: item.title, image: image, tag: index+100)
            tabbarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
            vc.tabBarItem = tabbarItem
            vcs.append(nav)
        }
        self.viewControllers = vcs
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.mainFont(ofSize: 12)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.mainFont(ofSize: 12)], for: .selected)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(updateBadge), name: AppConstants.updateBadgeObserverID, object: nil)
        
//        viewControllers?.forEach {
//            if let navController = $0 as? UINavigationController {
//                navController.topViewController?.view
//            } else {
//                $0.view.description
//            }
//        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false // Make sure you want this as false
        }
        
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.5, options: [.transitionCrossDissolve], completion: nil)
        }
        
        return true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let orderedTabBarItemViews: [UIView] = {
            let interactionViews = tabBar.subviews.filter({ $0 is UIControl })
            return interactionViews.sorted(by: { $0.frame.minX < $1.frame.minX })
        }()
        
        guard let index = tabBar.items?.firstIndex(of: item),
              let subview = orderedTabBarItemViews[index].subviews.first else { return }
        
        performSpringAnimation(for: subview)
        
    }
    
    func performSpringAnimation(for view: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            view.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }, completion: nil)
    }
    
    @objc func updateBadge(notif: Notification) {
        setupNotification()
    }
    
    func setupNotification() {
//        NotificationAPIService.shared.getNotificationCount { (notification, message, msgCount, grpCount, meetingCount, reviewCount, error, isLoggedIn) in
//            if let err = error {
//                print("Error : ", err)
//            } else {
//                
//                if let tabItems = self.tabBar.items {
//                    self.addRedDotAtTabBarItemIndex2(index: 2, isAdd: message > 0)
//                    self.addRedDotAtTabBarItemIndex2(index: 4, isAdd: notification > 0)
//                }
//                
//                if !isLoggedIn {
//                    self.logout()
//                }
//            }
//        }
    }
    
    func addRedDotAtTabBarItemIndex2(index: Int, isAdd: Bool) {
        for subview in tabBar.subviews {
            if subview.tag == index + 100 {
                subview.removeFromSuperview()
                break
            }
        }
        if !isAdd {
            return
        }
        
        let RedDotRadius: CGFloat = 5
        let RedDotDiameter = RedDotRadius * 2
        let TopMargin:CGFloat = 5
        let TabBarItemCount = CGFloat(self.tabBar.items!.count)
        let screenSize = UIScreen.main.bounds
        let HalfItemWidth = (screenSize.width) / (TabBarItemCount * 2)
        let  xOffset = HalfItemWidth * CGFloat(index * 2 + 1)
        
        let imageHalfWidth: CGFloat = (self.tabBar.items![index] ).selectedImage!.size.width / 2
        let redDot = UIView(frame: CGRect(x: xOffset + imageHalfWidth - 7, y: TopMargin, width: RedDotDiameter, height: RedDotDiameter))
        redDot.backgroundColor = UIColor.colorFromHex("FF617C")
        redDot.layer.cornerRadius = RedDotRadius
        redDot.tag = index + 100
        self.tabBar.addSubview(redDot)
    }
    
}
