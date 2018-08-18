//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by coco j on 2018/08/17.
//  Copyright © 2018年 coco j. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var zoomImage: UIImageView!

    
    
    var resultDispImageNo: Int?
    
    let resultImageNameArray = [
        
        "catfree.jpg",
        "catfree2.jpg",
        "catfree3.jpg",
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

         let name = resultImageNameArray[resultDispImageNo!]
        let image = UIImage(named: name)
        zoomImage.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
