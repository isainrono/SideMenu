//
//  SettingsController.swift
//  ProfileMenu
//
//  Created by isain on 02/04/2019.
//  Copyright © 2019 326Spain. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    // ISAIN: -Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func configureUI () {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.title = "Settings"
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-reddit_inbox_filled").withRenderingMode(.alwaysOriginal), style:  .plain, target: self, action: #selector(handleDismiss))
    }
}
