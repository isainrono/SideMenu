//
//  MenuController.swift
//  ProfileMenu
//
//  Created by isain on 31/03/2019.
//  Copyright © 2019 326Spain. All rights reserved.
//

import UIKit

private let reuseIdentifer = "MenuOptionCell"
class MenuController:UIViewController {
    // ISAIN: - Properties
    //var profileImage: UIImageView!
    var tableView: UITableView!
    var delegate: HomeControllerDelegate?
    // ISAIN: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Functionalities.convertCirculImage(img: imageView)
        //view.addSubview(imageView)
        configureTableView()
    }
    // ISAIN: - Handlers
    
    func configureTableView() {
        //profileImage = UIImageView.init(image: UIImage(named: "inbox"))
        tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifer)
        
        tableView.backgroundColor = .darkGray
        tableView.contentInset = UIEdgeInsets(top: 120, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        /*view.addSubview(profileImage)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        profileImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true*/
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        

    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MenuOptionCell
        
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
    
    
}

