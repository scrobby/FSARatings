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
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        ratingsView.backgroundColor = .greenColor()
        
        slider.setValue(2, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        ratingsView.setNeedsDisplay()
        ratingsView.setNeedsLayout()
    }

    @IBAction func sliderChanged(sender: UISlider) {
        ratingsView.setCurrentRatingTo(Int(slider.value), animated: false)
    }
}

