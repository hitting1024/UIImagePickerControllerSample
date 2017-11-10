//
//  ViewController.swift
//  UIImagePickerControllerSample
//
//  Created by hitting on 2017/11/10.
//  Copyright © 2017年 hitting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.showsCameraControls = false
        
        // full screen camera
        let screenSize = UIScreen.main.bounds.size
        let cameraAspectRatio = CGFloat(4.0 / 3.0)
        let cameraImageHeight = screenSize.width * cameraAspectRatio
        let scale = screenSize.height / cameraImageHeight
        imagePickerController.cameraViewTransform = CGAffineTransform(translationX: 0, y: (screenSize.height - cameraImageHeight)/2)
        imagePickerController.cameraViewTransform = imagePickerController.cameraViewTransform.scaledBy(x: scale, y: scale)
        
        self.present(imagePickerController, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
