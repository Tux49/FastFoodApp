//
//  ViewController.swift
//  FastFoodApp
//
//  Created by Thierry Huu on 27/10/2018.
//  Copyright © 2018 Thierry Huu. All rights reserved.
//

import UIKit

class CameraController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var predictionLabel: UILabel!
    
    let alertHelper = AlertHelper.show
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func takePicture(_ sender: Any) {
    }
}

