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

@IBDesignable public class FSARatingsView: UIView {
    @IBInspectable public var currentRating: Int {
        didSet {
            //TODO: Handle transitons
            if currentRating > 5 {
                currentRating = 5
            } else if currentRating < 0 {
                currentRating = 0
            }
        }
    }
    
    public var currentLocale: FSALocale = .English {
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
    
    public required init?(coder aDecoder: NSCoder) {
        self.currentRating = 0
        
        super.init(coder: aDecoder)
    }
    
    
    //MARK: - Drawing
    public override func drawRect(rect: CGRect) {
//        let ctx = UIGraphicsGetCurrentContext()
        print("Drawing?")
        
        //TODO: Calculate the proportional roundedness
        let cornerRadius: CGFloat = 2.0
        let borderWidth: CGFloat = 1.0
        
        let newRect = CGRect(x: self.frame.origin.x + borderWidth, y: self.frame.origin.y + borderWidth, width: self.frame.width - borderWidth * 2, height: self.frame.height - borderWidth * 2)
        
        let path = UIBezierPath(roundedRect: newRect, cornerRadius: cornerRadius)
        UIColor.redColor().setStroke()
//        FSAColors.greenColor().setStroke()
        
        path.stroke()
    }
    
    public override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 300, height: 200)
    }
    
    //MARK: - Setting Variables
    public func setCurrentRatingTo(newRating: Int, animated: Bool) {
        print("Well at least that did something…")
    }
}


//MARK: - Colour Constants
public class FSAColors: NSObject {
    public class func greenColor() -> UIColor {
        return UIColor(red: 215.0/255.0, green: 228.0/255.0, blue: 87.0/255.0, alpha: 1.0)
    }
}







