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
        //TODO: Calculate the proportional roundedness
        let cornerRadius: CGFloat = 2.0
        let borderWidth: CGFloat = 1.0
        
        let newRect = CGRect(x: self.bounds.origin.x + borderWidth, y: self.bounds.origin.y + borderWidth, width: self.bounds.width - borderWidth * 2, height: self.bounds.height - borderWidth * 2)
        
        let path = UIBezierPath(roundedRect: newRect, cornerRadius: cornerRadius)
        UIColor.redColor().setStroke()
        UIColor.blueColor().setFill()
        
        path.fill()
        path.stroke()
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 300, height: 200)
    }
    
    //MARK: - Setting Variables
    func setCurrentRatingTo(newRating: Int, animated: Bool) {
        print("Well at least that did something…")
    }
}


//MARK: - Colour Constants
class FSAColors: NSObject {
    class func greenColor() -> UIColor {
        return UIColor(red: 215.0/255.0, green: 228.0/255.0, blue: 87.0/255.0, alpha: 1.0)
    }
}







