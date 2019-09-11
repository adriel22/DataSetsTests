//
//  PickerDataSource.swift
//  DataSetsTests
//
//  Created by Adriel Freire on 11/09/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import Foundation
import  UIKit

class PickerDataSource: NSObject, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    
}
