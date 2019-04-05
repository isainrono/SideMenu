//
//  ContainerController.swift
//  ProfileMenu
//
//  Created by isain on 31/03/2019.
//  Copyright © 2019 326Spain. All rights reserved.
//

import UIKit

class ContainerController:UIViewController {
    // ISAIN: - Properties
    
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    // ISAIN: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    // ISAIN: - Handlers
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            let imageName = "goku"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            
            imageView.frame = CGRect(x: 60, y: 50, width: 110, height: 110)
            imageView.backgroundColor = .white
            imageView.contentMode = .scaleAspectFit
            Functionalities.convertCirculImage(img: imageView)
            menuController.view.addSubview(imageView)
            print("Did add menu controller....")
        }
    }
    
    func showMenuController(shouldExpand: Bool, menuOption:MenuOption?){
        if shouldExpand {
            // show View
            UIView.animate(withDuration: 0.5,delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity:0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 150
            }, completion: nil)
        } else {
            // hide View
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Profile:
            print("Show profile")
        case .Inbox:
            print("Shoe inbox")
        case .Notification:
            print("show notification")
        case .Settings:
            print("Shoe Sttings")
            let controller = SettingsController()
            present(UINavigationController(rootViewController: controller),animated: true, completion: nil)
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5,delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity:0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded, menuOption: menuOption)
    }
    
    
}

