//
//  Functionalities.swift
//  ProfileMenu
//
//  Created by isain on 03/04/2019.
//  Copyright © 2019 326Spain. All rights reserved.
//
import Foundation
import UIKit

class Functionalities {
    
    static func convertCirculImage(img: UIImageView) {
        print("entra aqui")
        img.layer.borderWidth = 1
        img.layer.masksToBounds = false
        //imgRounded.layer.borderColor = UIColor.black.cgColor
        img.layer.cornerRadius = img.frame.height/2
        img.clipsToBounds = true
    }
    
    
}
