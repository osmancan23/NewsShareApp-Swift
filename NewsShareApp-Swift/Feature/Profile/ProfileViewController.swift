//
//  ProfileViewController.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 12.07.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileView = ProfileView()
        view = profileView
        profileView.delegate = self
        
    }
    

    
}

extension ProfileViewController : ProfileViewProtocol {
    
}


#Preview{
    ProfileViewController()
}
