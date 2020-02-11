//
//  ViewController.swift
//  Photo Editor
//
//  Created by A.K.M. Sazzad Hossain on 2/11/20.
//  Copyright © 2020 A.K.M. Sazzad Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var CIFilterNames = [
        "CIPhotoEffectChrome",
        "CIPhotoEffectFade",
        "CIPhotoEffectInstant",
        "CIPhotoEffectNoir",
        "CIPhotoEffectProcess",
        "CIPhotoEffectTonal",
        "CIPhotoEffectTransfer",
        "CISepiaTone"
    ]

    @IBOutlet weak var originalImage: UIImageView!
    @IBOutlet weak var imageToFilter: UIImageView!
    @IBOutlet weak var filtersScrollView: UIScrollView!
    var currentImage = UIImage(named: "nature")
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(importPicture))
        scrollViewBtn()
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    @objc func importPicture(){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else{return}
        dismiss(animated: true, completion: nil)
        currentImage = image
        originalImage.image = currentImage
        scrollViewBtn()
    }
    
    func scrollViewBtn(){
        var xCoord: CGFloat = 5
        let yCoord: CGFloat = 5
        let buttonWidth: CGFloat = 70
        let buttonHeight: CGFloat = 70
        let gapBetweenButtons: CGFloat = 5
        
        var iteamCount = 0
        for i in 0..<CIFilterNames.count{
            iteamCount = i
            
            //Button properties
            let filterButton = UIButton(type: .custom)
            filterButton.frame = CGRect(x: xCoord, y: yCoord, width: buttonWidth, height: buttonHeight)
            filterButton.titleLabel?.text = CIFilterNames[iteamCount]
            filterButton.tag = iteamCount
            filterButton.addTarget(self, action: #selector(filterButtonTapped(sender:)), for: .touchUpInside)
            filterButton.layer.cornerRadius = 6
            filterButton.clipsToBounds = true
            
            //create the filters for each button
            let ciContext = CIContext(options: nil)
            let coreImage = CIImage(image: currentImage!)
            //let coreImage = CIImage(image: currentImage)
            let filter = CIFilter(name: "\(CIFilterNames[i])")
            filter?.setDefaults()
            filter?.setValue(coreImage, forKey: kCIInputImageKey)
            let filteredImageData = filter?.value(forKey: kCIOutputImageKey) as! CIImage
            let filteredimageRef = ciContext.createCGImage(filteredImageData, from: filteredImageData.extent)
            let imageForButton = UIImage(cgImage: filteredimageRef!)
            
            //assign filtered image to the button
            filterButton.setBackgroundImage(imageForButton, for: .normal)
            
            // add buttons in the scroll view
            xCoord += buttonWidth + gapBetweenButtons
            filtersScrollView.addSubview(filterButton)
        } // end for loop
        //resize scroll view
        filtersScrollView.contentSize = CGSize(width: buttonWidth * CGFloat(iteamCount+2), height: yCoord)
    }
    
    //filter button action
    @objc func filterButtonTapped(sender: UIButton){
        let button = sender as UIButton
        imageToFilter.image = button.backgroundImage(for: UIControl.State.normal)
    }
    
    @IBAction func savePicButton(_ sender: Any) {
        //save the image into camera roll
        UIImageWriteToSavedPhotosAlbum(imageToFilter.image!, nil, nil, nil)
        
        let alertController = UIAlertController(title: "Saved", message: "Your altered image has been saved to your photos", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)

    }
}

