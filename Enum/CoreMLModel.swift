//
//  CoreMLModel.swift
//  DataSetsTests
//
//  Created by Joao Batista on 10/09/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import Foundation
import  CoreML
enum CoreMLModel:Int {
    case jaffe = 0
    case faceExpressionRecognition = 1
    
    static var models: [Any] = [jafee(), FaceExpressionRecognition_Normal()]
}
