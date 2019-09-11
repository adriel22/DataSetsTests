//
//  HomeView.swift
//  DataSetsTests
//
//  Created by Adriel Freire on 10/09/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import Foundation
import UIKit
class HomeView: UIView {
    private let pickerDataSource = PickerDataSource()
    private let pickerDelegate = PickerDelegate()
    
    lazy var image: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    
    lazy var picker: UIPickerView = {
       let picker = UIPickerView()
        picker.backgroundColor = UIColor.white
        picker.layer.borderWidth = 0.3
        picker.dataSource = pickerDataSource
        picker.delegate = pickerDelegate
        
        return picker
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.green
        button.titleLabel?.text = "Take photo"
        button.setTitle("Take photo", for: .normal)
        return button
    }()
    
    init(){
        super.init(frame: .zero)
        setUpViews()
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        self.addSubview(image)
        self.addSubview(picker)
        self.addSubview(label)
        self.addSubview(button)
    }
    
    func setUpConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        picker.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        image.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        image.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        
        label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label.topAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
//        picker.heightAnchor.constraint(equalToConstant: 50).isActive = true
        picker.topAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        picker.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: button.topAnchor,constant: 5).isActive = true
        picker.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        button.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        button.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    override func didMoveToSuperview() {
        setUpConstraints()
    }
}
