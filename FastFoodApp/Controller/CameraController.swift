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
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.allowsEditing = false
    }

    @IBAction func takePicture(_ sender: Any) {
        alertHelper.cameraChoice(controller: self, picker: picker)
    }
}

extension CameraController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let original = info[.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.imageView.image = original
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
