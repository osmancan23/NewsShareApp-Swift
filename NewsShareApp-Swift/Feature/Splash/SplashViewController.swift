//
//  ViewController.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 12.02.2024.
//

import UIKit
import SnapKit


class SplashViewController: UIViewController {
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    override func loadView() {
        let splashView = SplashView()
        self.view = splashView
        splashView.delegate = self
    }

    
    
    
}

extension SplashViewController : SplashViewProtocol {
    
    func onTapGetStartedButton() {
        let loginView = LoginViewController()
        self.navigationController?.pushViewController(loginView, animated: true)
    }
    
    
}

/*
#Preview{
    SplashViewController()
}
*/
