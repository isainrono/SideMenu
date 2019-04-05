 //
//  MenuOption.swift
//  ProfileMenu
//
//  Created by isain on 02/04/2019.
//  Copyright © 2019 326Spain. All rights reserved.
//
import UIKit
 enum MenuOption: Int, CustomStringConvertible {
    
    case Profile
    case Inbox
    case Notification
    case Settings
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notification: return "Notification"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(named: "profile") ?? UIImage()
        case .Inbox: return UIImage(named: "inbox") ?? UIImage()
        case .Notification: return UIImage(named: "notification") ?? UIImage()
        case .Settings: return UIImage(named: "settings") ?? UIImage()
        }
    }
    
 }
