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

    var resultImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        zoomImage.image = resultImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
