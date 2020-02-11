//
//  ViewController.swift
//  Photo Editor
//
//  Created by A.K.M. Sazzad Hossain on 2/11/20.
//  Copyright © 2020 A.K.M. Sazzad Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViewBtn()
        // Do any additional setup after loading the view.
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
            let coreImage = CIImage(image: originalImage.image!)
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
        
//        let alert = UIAlertView(title: "Photo Editor", message: "Your image has been saved to photo library", delegate: nil, cancelButtonTitle: "OK")
        let alertController = UIAlertController(title: "Saved", message: "Your altered image has been saved to your photos", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)

    }
}

