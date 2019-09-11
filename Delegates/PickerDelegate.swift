//
//  PickerDelegate.swift
//  DataSetsTests
//
//  Created by Adriel Freire on 11/09/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import Foundation
import UIKit

class PickerDelegate: NSObject, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let teste = CoreMLModel.models[row]
        return String(describing: type(of: teste))
    }
}
