//
//  AlertHelper.swift
//  FastFoodApp
//
//  Created by Thierry Huu on 27/10/2018.
//  Copyright © 2018 Thierry Huu. All rights reserved.
//

import UIKit

class AlertHelper {
    
    private static let _show = AlertHelper()
    
    static var show: AlertHelper {
        return _show
    }
    
    func cameraChoice(controller: CameraController, picker: UIImagePickerController) {
        let alert = UIAlertController(title: "Prendre une photo",
            message: "Quel média voulez-vous utiliser ?",
            preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Appareil photo",
            style: .default) { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    picker.sourceType = .camera
                    controller.present(picker, animated: true, completion: nil)
                } else {
                    self.error(controller: controller, error: "L'appareil photo n'est pas disponible")
                }
        }
        
        let gallery = UIAlertAction(title: "Gallerie de photos",
            style: .default) { (action) in
            picker.sourceType = .photoLibrary
            controller.present(controller, animated: true, completion: nil)
        }
        
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        
        alert.addAction(camera)
        alert.addAction(gallery)
        alert.addAction(cancel)
        
        // Code nécessaire pour l'iPad
        if let pop = alert.popoverPresentationController {
            pop.sourceView = controller.view
            pop.sourceRect = CGRect(x: controller.view.frame.midX,
                                    y: controller.view.frame.midY,
                                    width: 0, height: 0)
            pop.permittedArrowDirections = []
        }
        // Fin code pour l'iPad
        
        controller.present(alert, animated: true, completion: nil)
    }
    
    func error(controller: CameraController, error: String) {
        let alert = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
