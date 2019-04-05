//
//  HomeController.swift
//  ProfileMenu
//
//  Created by isain on 31/03/2019.
//  Copyright © 2019 326Spain. All rights reserved.
//

import UIKit

class HomeController:UIViewController {
    // ISAIN: - Properties
    

    
    @IBOutlet weak var isa: UIImageView!
    var delegate: HomeControllerDelegate?
    // ISAIN: - Init
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* let controller = storyboard!.instantiateViewController(withIdentifier: "mainView")
        
        addChild(controller)
        view.addSubview(controller.view)
        controller.didMove(toParent: self)*/
        
        let imageName = "goku"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: 125, y: 270, width: 100, height: 200)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "I'm a test label"
        
        

        self.view.addSubview(label)
        //self.view.addSubview(label)
        //self.view.addSubview(nombre!)
        
        view.backgroundColor = .white
        
        confgureNavigationBar()
        
        
    }
    // ISAIN: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func confgureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    
}

