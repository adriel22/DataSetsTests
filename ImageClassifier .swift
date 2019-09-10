//
//  ImageClassifier .swift
//  DataSetsTests
//
//  Created by Joao Batista on 10/09/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import Vision

class ImageClassifier{
    let modelClassifier = [ Inceptionv3(), Inceptionv3()]
    func classifier(image: UIImage,InModel model: CoreMLModel) -> String? {
            var identifier = String()
            guard let model = try? VNCoreMLModel(for: modelClassifier[model.rawValue].model) else {
                print("Modelo não criado")
                return nil
        }
            let request =  VNCoreMLRequest(model: model) { (finishedReq, err) in
                guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
                guard let firstObservation = results.first else { return }
                print(results)
                identifier = firstObservation.identifier
            }
            guard let imageCI = CIImage(image: image) else {
                print("Impossivel converter imagem para CIImage")
                return nil
            }
            try? VNImageRequestHandler(ciImage: imageCI , options: [:]).perform([request])
            
         return identifier
        }
    
    }


