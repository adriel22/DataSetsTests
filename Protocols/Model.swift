//
//  Model.swift
//  DataSetsTests
//
//  Created by Adriel Freire on 11/09/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import Foundation
import CoreML

protocol Model {
    var model: MLModel { get }
}
