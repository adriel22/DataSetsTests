//
//  ViewController.swift
//  DataSetsTests
//
//  Created by Adriel Freire on 10/09/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let customView = HomeView()
    override func loadView() {
        self.view = customView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customView.button.addTarget(self, action: #selector(takePicture), for: .touchUpInside)
    }

    @objc func takePicture() {
        print("clicked")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        customView.image.image = pickedImage
        
        picker.dismiss(animated: true, completion: nil)
    }
}
