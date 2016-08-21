//
//  FSARatingsView.swift
//  FSARatings
//
//  Created by Carl Goldsmith on 21/08/2016.
//  Copyright © 2016 carlgoldsmith. All rights reserved.
//

import Foundation
import UIKit

public enum FSALocale: String {
    case English = "en-GB"
    case Welsh = "cy-GB"
}

@IBDesignable class FSARatingsView: UIView {
    @IBInspectable var currentRating: Int {
        didSet {
            //TODO: Handle transitons
            if currentRating > 5 {
                currentRating = 5
            } else if currentRating < 0 {
                currentRating = 0
            }
            
            self.setNeedsDisplay()
        }
    }
    
    var currentLocale: FSALocale = .English {
        didSet {
            //TODO: Handle language change
        }
    }
    
    //MARK: - Initialisers
    convenience init(rating: Int) {
        self.init()
        
        self.currentRating = rating
    }
    
    override init(frame: CGRect) {
        currentRating = 0
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.currentRating = 0
        
        super.init(coder: aDecoder)
    }
    
    
    //MARK: - Drawing
    override func drawRect(rect: CGRect) {
        //MARK: Draw the background rectangle
        //TODO: Calculate the proportional roundedness
        let cornerRadius: CGFloat = 4.0
        let borderWidth: CGFloat = 2.0
        
        //Create the rectangle that will fit within the view's bounds even with the border
        let newRect = CGRect(x: self.bounds.origin.x + borderWidth, y: self.bounds.origin.y + borderWidth, width: self.bounds.width - borderWidth * 2, height: self.bounds.height - borderWidth * 2)
        
        let outlinePath = UIBezierPath(roundedRect: newRect, cornerRadius: cornerRadius)
        
        FSAColors.strokeColor().setStroke()
        FSAColors.backgroundColor().setFill()
        
        outlinePath.lineWidth = borderWidth
        
        outlinePath.fill()
        outlinePath.stroke()
        
        //MARK: Create bottom section
        let topBottomHeight = newRect.height * 0.22
        
        let bottomPath = UIBezierPath(roundedRect: CGRect(x: borderWidth, y: self.bounds.height - topBottomHeight, width: newRect.width, height: topBottomHeight - borderWidth), byRoundingCorners: [UIRectCorner.BottomRight, UIRectCorner.BottomLeft], cornerRadii: CGSizeMake(cornerRadius, cornerRadius))
        
        FSAColors.strokeColor().setFill()
        bottomPath.fill()
        
        //MARK: Create top line
        let topPath = UIBezierPath()
        
        topPath.moveToPoint(CGPoint(x: borderWidth, y: topBottomHeight))
        topPath.addLineToPoint(CGPoint(x: self.bounds.width - borderWidth, y: topBottomHeight))
        
        topPath.lineWidth = borderWidth
        topPath.stroke()
        
        //MARK: Create numbers recursively (skipping the selected one)
        //Little Numbers
        let spacing: CGFloat = 14.0
        let numberWidth: CGFloat = (self.bounds.width - spacing * 6)/7
        let numberSize = CGSize(width: numberWidth, height: numberWidth)
        
        let largeNumberMultiplier: CGFloat = 1.5
        let largeNumberSize = CGSize(width: numberWidth * largeNumberMultiplier, height: numberWidth * largeNumberMultiplier)
        
        for n in 0...5 {
            let distance = (spacing + (CGFloat(n) * (spacing + numberWidth))) + (n > currentRating ? numberWidth/2 : 0)
            
            let circlePath = UIBezierPath(ovalInRect: CGRect(origin: CGPoint(x: distance, y: (self.bounds.height/2) - (n == currentRating ? largeNumberSize.height/2 : numberWidth/2)), size: n == currentRating ? largeNumberSize : numberSize))
            
            (n == currentRating ? FSAColors.strokeColor() : FSAColors.numberBackgroundColor()).setFill()
            FSAColors.strokeColor().setStroke()
            
            circlePath.lineWidth = borderWidth
            
            circlePath.fill()
            circlePath.stroke()
        }
        
        //MARK: Draw the selected number
        
        
        //MARK: Draw triangle
        
        
        //MARK: Draw text at the bottom (take into account language)
        
        
        //MARK: Draw the Food Hygiene Rating logo (maybe do this separately because knife and fork)
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 290, height: 148)
    }
    
    //MARK: - Setting Variables
    func setCurrentRatingTo(newRating: Int, animated: Bool) {
        self.currentRating = newRating
    }
}


//MARK: - Colour Constants
class FSAColors: NSObject {
    class func backgroundColor() -> UIColor {
        return UIColor(red: 215.0/255.0, green: 228.0/255.0, blue: 87.0/255.0, alpha: 1.0)
    }
    
    class func strokeColor() -> UIColor {
        return .blackColor()
    }
    
    class func numberBackgroundColor() -> UIColor {
        return .whiteColor()
    }
}









