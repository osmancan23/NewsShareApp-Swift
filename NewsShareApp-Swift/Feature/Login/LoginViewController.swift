//
//  LoginViewController.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 21.06.2024.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginView = LoginView()
        self.view = loginView
        loginView.delegate = self
        
        
    }


}

extension LoginViewController : LoginViewProtocol {
    
    func onTapGoogleButton() {
        let view = HomeViewController()
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func onTapAppleButton() {
        let view = HomeViewController()
        self.navigationController?.setViewControllers([view], animated: true)
    }
}

#Preview{
    LoginViewController()
}
