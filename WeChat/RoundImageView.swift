//
//  RoundImageView.swift
//  WeChat
//
//  Created by I_MT on 16/9/4.
//  Copyright © 2016年 I_MT. All rights reserved.
//

import UIKit
@IBDesignable
class RoundImageView: UIImageView {
    
    @IBInspectable var cornerRadius :CGFloat = 0 {
        willSet{
            
            }
        didSet{
                layer.cornerRadius = cornerRadius
                layer.masksToBounds = cornerRadius > 0
        }
        
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            layer.borderWidth  = borderWidth
            
        }
    }
    @IBInspectable var borderColor:UIColor = UIColor.clearColor(){
        didSet{
            layer.borderColor = borderColor.CGColor
        }
    }
}
