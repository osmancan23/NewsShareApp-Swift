//
//  LoginView.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 22.06.2024.
//

import Foundation
import UIKit

class LoginView : UIView {
    private lazy var  imageView : UIImageView = {
        let image = UIImage(named: "splashImage")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        
        return imageView
     }()
     
     private lazy var titleLabel : UILabel = {
        let label = UILabel()
         label.text = "News Share"
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 36)
         
         return label
     }()
     
     private lazy var subtitleLabel : UILabel = {
        let label = UILabel()
         label.text = "Stay updated with latest news"
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 18)
         
         return label
     }()
     
    private lazy var emailField :UITextField = {
         let textField = UITextField()
         textField.translatesAutoresizingMaskIntoConstraints = false
         textField.placeholder = "Email"
         textField.keyboardType = UIKeyboardType.emailAddress
         textField.returnKeyType = UIReturnKeyType.done
         textField.autocorrectionType = UITextAutocorrectionType.no
         textField.font = UIFont.systemFont(ofSize: 13)
         textField.textColor = .black
         textField.borderStyle = UITextField.BorderStyle.roundedRect
         textField.layer.borderWidth = 0.9
         textField.layer.cornerRadius = 8
         textField.clearButtonMode = UITextField.ViewMode.whileEditing;
         textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
     }()
     
     private lazy var passwordField :UITextField = {
          let textField = UITextField()
          textField.translatesAutoresizingMaskIntoConstraints = false
          textField.placeholder = "Password"
          textField.keyboardType = UIKeyboardType.emailAddress
          textField.returnKeyType = UIReturnKeyType.done
          textField.autocorrectionType = UITextAutocorrectionType.no
          textField.font = UIFont.systemFont(ofSize: 13)
          textField.textColor = .black
          textField.borderStyle = UITextField.BorderStyle.roundedRect
          textField.layer.borderWidth = 0.9
          textField.layer.cornerRadius = 8
          textField.clearButtonMode = UITextField.ViewMode.whileEditing;
          textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
         return textField
      }()
     
     private lazy var loginButton : UIButton = {
        let button = UIButton()
         button.setTitle("Log In", for: .normal)
         button.setTitleColor(.black, for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.backgroundColor = .clear
         button.layer.cornerRadius = 10
         button.layer.borderWidth = 1
         button.layer.borderColor = UIColor.black.cgColor
         return button
     }()
     
     private lazy var googleButton : UIButton = {
        let button = UIButton()
         button.setTitle("Google", for: .normal)
         button.setTitleColor(.black, for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.backgroundColor = .clear
         button.layer.cornerRadius = 10
         button.layer.borderWidth = 1
         button.layer.borderColor = UIColor.black.cgColor
         return button
     }()
     
     private lazy var appleButton : UIButton = {
        let button = UIButton()
         button.setTitle("Apple", for: .normal)
         button.setTitleColor(.black, for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.backgroundColor = .clear
         button.layer.cornerRadius = 10
         button.layer.borderWidth = 1
         button.layer.borderColor = UIColor.black.cgColor
         return button
     }()
     
     
     
     private lazy var rowStackView : UIStackView = {
         let stackView = UIStackView()
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.distribution = .fillEqually
         stackView.spacing = 24
         return stackView
     }()
     
     private lazy var registerTextButton : UIButton = {
        let button = UIButton()
         button.setTitle("Sign Up", for: .normal)
         button.setTitleColor(.black, for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.backgroundColor = .clear
      
         return button
     }()
     
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(emailField)
        self.addSubview(passwordField)
        self.addSubview(loginButton)
        
        rowStackView.addArrangedSubview(googleButton)
        rowStackView.addArrangedSubview(appleButton)
        
        self.addSubview(rowStackView)
        self.addSubview(registerTextButton)
        
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(80)
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(50)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalTo(titleLabel)
        }
        
        emailField.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(45)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        passwordField.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(45)
            make.top.equalTo(emailField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(45)
            make.top.equalTo(passwordField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        googleButton.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
        
        appleButton.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
        
        rowStackView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(45)
            make.top.equalTo(loginButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        registerTextButton.snp.makeConstraints { make in
            make.top.equalTo(rowStackView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
