//
//  ViewController.swift
//  FSARatingsViewExampleApp
//
//  Created by Carl Goldsmith on 21/08/2016.
//  Copyright © 2016 carlgoldsmith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var ratingsView: FSARatingsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        ratingsView.backgroundColor = .greenColor()
        ratingsView.setCurrentRatingTo(20, animated: true)
        ratingsView.setNeedsDisplay()
        ratingsView.setNeedsLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        ratingsView.setNeedsDisplay()
        ratingsView.setNeedsLayout()
    }


}

