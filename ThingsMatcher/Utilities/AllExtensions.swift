//
//  UIViewController+Extension.swift
//  Template
//
//  Created by Syed Arsalan Shah.
//  Copyright © 2017 Syed Arsalan Shah. All rights reserved.
//

import UIKit

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension UIViewController {
    
    class var storyboardId : String {
        return "\(self)"
    }
    
    func removeChild() {
        self.children.forEach {
            $0.didMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!;
    }

}

extension UITableViewCell {
    class var storyboardId : String {
        return "\(self)"
    }
    
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!;
    }
}

extension UICollectionViewCell {
    
    class var storyboardId : String {
        return "\(self)"
    }
    
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!;
    }
}


public extension UIFont {
    static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    static func mainFont(ofSize size: CGFloat,isBold : Bool = false) -> UIFont {
        return customFont(name: isBold ? "Helvetica-Bold" : "Helvetica", size: size)
    }
}


public struct BidBoxConstants {
    static var vibrationValue = 1519
    
    static var hitTheBidDesc = "The seller has enabled 'Hit The Bid'. This means that at any time throughout the auction, the seller may accept a bid which is at a level they are happy to sell, regardless of the time left in the auction schedule.\nAs soon as the seller 'hits the bid', the time remaining in the auction will be:\nAuction duration +5 days = 24 hours\nAuction duration -5 days = 1 hour\nOnce the seller has hit the bid, each bidder will be notified of the new auction expiry date and time."
    
    static var wonMessage = "\nCongratulations! You are the winning bidder at:\n"
    static var lostMessage = "\nThis auction has ended - SOLD \nUnfortunately you weren't successful this time.\n"
    static var unsoldMessage = "\nThis item could not meet reserve amount and remained unsold.\n"
}

extension UICollectionView {
    func validate(indexPath: IndexPath) -> Bool {
        if indexPath.section >= numberOfSections {
            return false
        }
        if indexPath.row >= numberOfItems(inSection: indexPath.section) {
            return false
        }
        return true
    }
}

extension UITableView {
    func validate(indexPath: IndexPath) -> Bool {
        if indexPath.section >= numberOfSections {
            return false
        }
        if indexPath.row >= numberOfRows(inSection: indexPath.section) {
            return false
        }
        return true
    }
}

extension UIColor {
    
    public static let AppBlue = UIColor(named: "AppBlue")!//UIColor(red: 21/255, green: 120/255, blue: 252/255, alpha: 1)
    public static let AppGreen = UIColor(red: 0/255, green: 213/255, blue: 147/255, alpha: 1)
    public static let AppLightGray = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
    public static let AppLighterGray = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
//    public static let AppDarkGray = UIColor(red: 32/255, green: 60/255, blue: 83/255, alpha: 1)
    public static let AppDarkGray = UIColor(red: 0.264, green: 0.32, blue: 0.39, alpha: 1)
    public static let AppRed = UIColor(red: 254/255, green: 95/255, blue: 95/255, alpha: 1)
    public static let AppYellow = UIColor(red: 254/255, green: 234/255, blue: 158/255, alpha: 1)
    
    public static let AppBlue2 = UIColor(named: "AppBlue")
    public static let AppGreen2 = UIColor(named: "AppGreenAlpha")
    public static let AppLightGray2 = UIColor(named: "SeparatorColor")
    public static let AppDarkGray2 = UIColor(named: "AppDarkGray")
    public static let AppRed2 = UIColor(named: "AppRed")
    
    public static let AppLightBlue = UIColor(named: "AppBlueAlpha")!
    public static let Logo3rdColor = UIColor(named: "Logo3rdColor")!
    
    static func rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    static func colorFromHex(_ hex: String) -> UIColor {
        
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            
            return UIColor.magenta
        }
        
        var rgb: UInt32 = 0
        Scanner.init(string: hexString).scanHexInt32(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16)/255,
                            green: CGFloat((rgb & 0x00FF00) >> 8)/255,
                            blue: CGFloat(rgb & 0x0000FF)/255,
                            alpha: 1.0)
    }
    
    func toHex() -> Int? {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return Int(String(format:"#%06x", rgb), radix: 16)
    }
}

extension UIView {
    
    func slightRound(radius: CGFloat = 15, isFullRound: Bool? = true) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func halfRound() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    
    func completeRound() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    func completeRect() {
        self.layer.cornerRadius = 0
        self.clipsToBounds = true
    }
    
    func roundAndShadow() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 3.0
    }
    
    func addDropShadow() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3.0)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 5.0
        layer.masksToBounds = false
    }
    
    func unrealRoundAndShadow2(shadowColor: UIColor = UIColor.lightGray,
                    fillColor: UIColor = UIColor.white,
                    opacity: Float = 0.6,
                    offset: CGSize = CGSize(width: 0.0, height: 3.0),
                    radius: CGFloat = 10) -> CAShapeLayer {
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = offset
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = 3.0
        layer.insertSublayer(shadowLayer, at: 0)
        return shadowLayer
    }
    
    func unrealRoundAndShadow() {
        let containerView = UIView()
        
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3.0)
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 3.0
        
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = self.backgroundColor
        
        layer.backgroundColor = UIColor.clear.cgColor
        
//        addSubview(containerView)
        insertSubview(containerView, at: 0)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        self.layoutIfNeeded()
        print(self.frame.height)
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func roundCorners1(corners: [UIRectCorner], radius: CGFloat) {
        var newCorners = CACornerMask()
        
        for item in corners {
            switch item {
                case .topLeft: newCorners.insert(.layerMinXMinYCorner)
                case .topRight: newCorners.insert(.layerMaxXMinYCorner)
                case .bottomLeft: newCorners.insert(.layerMinXMaxYCorner)
                case .bottomRight: newCorners.insert(.layerMaxXMaxYCorner)
            default: break
            }
        }
        layer.cornerRadius = radius
        layer.maskedCorners = newCorners
    }
    
    func setMyMessageCorners() {
        self.roundCorners1(corners: [.topLeft, .bottomRight, .bottomLeft], radius: 15)
    }
    func setMyTopMessageCorners() {
        self.roundCorners1(corners: [.topLeft, .bottomLeft, .topRight], radius: 15)
    }
    func setMyMidMessageCorners() {
        self.roundCorners1(corners: [.topLeft, .bottomLeft], radius: 15)
    }
    func setMyBottomMessageCorners() {
        self.roundCorners1(corners: [.topLeft, .bottomRight, .bottomLeft], radius: 15)
    }
    
    
    func setOtherMessageCorners() {
        self.roundCorners1(corners: [.topRight, .bottomRight, .bottomLeft], radius: 15)
    }
    func setOtherTopMessageCorners() {
        self.roundCorners1(corners: [.topRight, .bottomRight, .topLeft], radius: 15)
    }
    func setOtherMidMessageCorners() {
        self.roundCorners1(corners: [.topRight, .bottomRight], radius: 15)
    }
    func setOtherBottomMessageCorners() {
        self.roundCorners1(corners: [.topRight, .bottomRight, .bottomLeft], radius: 15)
    }
    
    func addConstraintsWithFormatString(formate: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formate, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
    
    func layerBlackGradient(_ cornerRadius: Int = 0) {
        let gradient: CAGradientLayer = CAGradientLayer()
        let startColor = UIColor.black.withAlphaComponent(0.4).cgColor
        let endStart = UIColor.clear.cgColor

        gradient.colors = [startColor, endStart]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = self.bounds
        autoresizingMask = [.flexibleWidth, .flexibleHeight]

        if cornerRadius > 0 {
            gradient.cornerRadius = CGFloat(cornerRadius)
        }
        self.layer.insertSublayer(gradient, at: 0)
    }
}

extension String {
    
    func getFlag() -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in self.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    func attributedStringWithColor(_ strings: [String], color: UIColor, characterSpacing: UInt? = nil) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for string in strings {
            let range = (self as NSString).range(of: string)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        
        guard let characterSpacing = characterSpacing else {return attributedString}
        
        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        
        return attributedString
    }
    
    func withCommas() -> String {
        let int = Int(self) ?? 0
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:int))!
    }
}

extension UITableView {
    
    func scrollToBottom(isAnimated: Bool = true){
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections - 1) - 1,
                section: self.numberOfSections - 1)
            if self.numberOfSections > indexPath.section && self.numberOfRows(inSection: 0) > indexPath.row && indexPath.row >= 0 && indexPath.section >= 0 {
                self.scrollToRow(at: indexPath, at: .bottom, animated: isAnimated)
            }
        }
    }
    
    func scrollToIndex(isAnimated: Bool = true, index: Int){
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: index,
                section: self.numberOfSections - 1)
            if self.numberOfSections > indexPath.section && self.numberOfRows(inSection: 0) > indexPath.row && indexPath.row >= 0 && indexPath.section >= 0 {
                self.scrollToRow(at: indexPath, at: .top, animated: isAnimated)
            }
        }
    }
    
    func scrollToTop(isAnimated: Bool = false) {
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.scrollToRow(at: indexPath, at: .top, animated: isAnimated)
        }
    }
}

extension UICollectionView {
    func scrollToLeft(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(item: self.numberOfItems(inSection:  self.numberOfSections - 1) - 1, section: self.numberOfSections - 1)
            self.scrollToItem(at: indexPath, at: .left, animated: false)
        }
    }
}


class HighPaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 10.0
    @IBInspectable var bottomInset: CGFloat = 10.0
    @IBInspectable var leftInset: CGFloat = 14.0
    @IBInspectable var rightInset: CGFloat = 14.0
    
    public override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    public override func sizeToFit() {
        super.sizeThatFits(intrinsicContentSize)
    }
}
