//
//  CoreMLHelper.swift
//  FastFoodApp
//
//  Created by Thierry Huu on 27/10/2018.
//  Copyright © 2018 Thierry Huu. All rights reserved.
//

import UIKit
import Vision
import CoreML

class CoreMLHelper {
    
    private static let _analyse = CoreMLHelper()
    
    static var analyse: CoreMLHelper {
        return _analyse
    }
    
    var completion: ((String?) -> Void)?
    let errorString = "Appuyez sur le burger pour choisir une image"
    
    func junkFood(_ image: UIImage?, completion: ((String?) -> Void)?) {
        self.completion = completion
        if let img = image {
            if let data = img.pngData() {
                do {
                    let model = try VNCoreMLModel(for: FastFood().model)
                    
                    let request = VNCoreMLRequest(model: model, completionHandler: response)
                    
                    let handler = VNImageRequestHandler(data: data, options: [:])
                    
                    try handler.perform([request])
                } catch {
                    completion?(errorString)
                }
            } else {
                completion?(errorString)
            }
        } else {
            completion?(errorString)
        }
    }
    
    func response(_ request: VNRequest, _ error: Error?) {
        if let results = request.results as? [VNClassificationObservation] {
            if results.count > 0 {
                let good = results[0]
                let confidence = " à \(Int(good.confidence * 100)) % de probabilité"
                let result = "Selon CoreML, ceci est " + good.identifier + confidence
                completion?(result)
            } else {
                completion?(errorString)
            }
        } else {
            completion?(errorString)
        }
    }
}
