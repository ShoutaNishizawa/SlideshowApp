//
//  ViewController.swift
//  SlideshowApp
//
//  Created by coco j on 2018/08/15.
//  Copyright © 2018年 coco j. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var OutletNext: UIButton!
    @IBOutlet weak var OutletPrev: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var timer: Timer?
    
    @IBAction func onPrev(_ sender: Any) {
        
        dispImageNo -= 1
        displayImage()
    }
    
    
    @IBAction func onNext(_ sender: Any) {
        dispImageNo += 1
        displayImage()
    }
    
    var dispImageNo = 0
    
    func displayImage() {
        
        let imageNameArray = [
        
        "catfree.jpg",
        "catfree2.jpg",
        "catfree3.jpg",
        
        ]
    
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
    let name = imageNameArray[dispImageNo]
    
    let image = UIImage(named: name)
    imageView.image = image
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "catfree.jpg")
        imageView.image = image
        
    }
    
    
    @IBAction func startPauseTimer(_ sender: Any) {
        
        if self.timer == nil {
            
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(timer:)), userInfo: nil, repeats: true)
            
            OutletNext.isEnabled = false
            OutletPrev.isEnabled = false
            
        } else if self.timer != nil {
            
            self.timer?.invalidate()
            self.timer = nil
            
            OutletNext.isEnabled = true
            OutletPrev.isEnabled = true
        }
    }
    
    @objc func onTimer(timer: Timer) {
        
        dispImageNo += 1
        
        displayImage()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.resultDispImageNo = dispImageNo
    }
    

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
}
}
