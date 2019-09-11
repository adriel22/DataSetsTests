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
    private let modelClassifier = [ jafee(), jafee()]
    
    /// Funcao para classificar as emoções do usuario com base em um modelo ja treinado
    ///
    /// - Parameters:
    ///   - image: imagem tirada pelo usuario para analise
    ///   - model: modelo utilizado para analise
    /// - Returns: sentimento identificado pelo modelo
    func classifier(Image image: UIImage,withModel model: CoreMLModel) -> String? {
        var identifier = String()
        
        /// Cria modelo e verifica se ele existe
        guard let model = try? VNCoreMLModel(for: modelClassifier[model.rawValue].model) else {
                return "Modelo não encontrado, tente novamente com outro"
        }
        /// Verifica a imagem e as possibilidades de acordo com a acuracia, pegando o primeiro pois tem o mais proximo
        let request =  VNCoreMLRequest(model: model) { (finishedReq, err) in
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            guard let firstObservation = results.first else { return }
            identifier = firstObservation.identifier
        }
        // Vision trabalha com CIImage
        guard let imageCI = CIImage(image: image) else {
            return "Imagem invalida, por favor tent tirar outra"
        }
        //Passa a imagem para a identificação e classificação do Vision e retorna o valor pra variavel request
        try? VNImageRequestHandler(ciImage: imageCI , options: [:]).perform([request])
            
        return identifier
        }
    
    }


