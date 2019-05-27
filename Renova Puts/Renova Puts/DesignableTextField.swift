//
//  DesignableTextField.swift
//  Renova Puts
//
//  Created by macOS Mojave on 22/5/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var leftImage: UIImage?{
        didSet {
            updateView()
        }
    }
    @IBInspectable var leftPadding: CGFloat = 0{
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        if let image = leftImage{
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 10, width: 20, height: 20))
            imageView.image = image
            
            var width = leftPadding + 30
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line{
                //width = width + 5
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 40))
            view.addSubview(imageView)
            //view.backgroundColor = 
            
            leftView = view
        }else{
            leftViewMode = .never
        }
    }

}
