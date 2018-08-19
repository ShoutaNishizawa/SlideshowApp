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
    @IBOutlet weak var startPauseButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var timer: Timer?
    
    var dispImageNo = 0
    
    let imageNameArray: [String] = [
        
        "catfree.jpg",
        "catfree2.jpg",
        "catfree3.jpg",
        
        ]
    
    var name: String?
    var image: UIImage?
    
    func displayImage() {
        
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        imageView.image = image
    }
    
    
    @IBAction func onPrev(_ sender: Any) {
        
        dispImageNo -= 1
        displayImage()
    }
    
    
    @IBAction func onNext(_ sender: Any) {
        
        dispImageNo += 1
        displayImage()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageName = imageNameArray.first {
            let image = UIImage(named: imageName)
            imageView.image = image
        }
        
        name = imageNameArray[dispImageNo]
        image = UIImage(named: name!)
        startPauseButton.setTitle("再生", for: .normal)
    }
    
    
    @objc func onTimer(timer: Timer) {
        
        dispImageNo += 1
        displayImage()
    }
    
    
    @IBAction func startPauseTimer(_ sender: Any) {
        
        if self.timer == nil {
            
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(timer:)), userInfo: nil, repeats: true)
            
            startPauseButton.setTitle("停止", for: .normal)
            OutletNext.isEnabled = false
            OutletPrev.isEnabled = false
            
        } else if self.timer != nil {
            
            self.timer?.invalidate()
            self.timer = nil
            
            startPauseButton.setTitle("再生", for: .normal)
            OutletNext.isEnabled = true
            OutletPrev.isEnabled = true
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.resultImage = image
        
        self.timer?.invalidate()
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
        self.timer = nil
        startPauseButton.setTitle("再生", for: .normal)
        OutletNext.isEnabled = true
        OutletPrev.isEnabled = true
    }
    
}
