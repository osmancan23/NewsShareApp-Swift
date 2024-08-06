//
//  LoginView.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 22.06.2024.
//

import Foundation
import UIKit

protocol LoginViewProtocol {
    func onTapGoogleButton()
    func onTapAppleButton()
}

class LoginView : UIView {

    var delegate : LoginViewProtocol?

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
     
    lazy var googleAction : UIAction = UIAction { _ in
        self.delegate?.onTapGoogleButton()
    }
     
     private lazy var googleButton : UIButton = {
        let button = CustomButtonView()
         button.setup(title: "Google")
         button.addAction(googleAction, for: .touchUpInside)
         return button
     }()
    
    lazy var appleAction : UIAction = UIAction { _ in
        self.delegate?.onTapAppleButton()
    }
     
     private lazy var appleButton : UIButton = {
        let button = CustomButtonView()
         button.setup(title: "Apple")
         button.addAction(appleAction, for: .touchUpInside)
         return button
     }()
     
     
     
     private lazy var rowStackView : UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.distribution = .fillEqually
         stackView.spacing = 24
         return stackView
     }()
     
    
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        
        
        rowStackView.addArrangedSubview(googleButton)
        rowStackView.addArrangedSubview(appleButton)
        
        self.addSubview(rowStackView)
        
        
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
        
       
        
        googleButton.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
        
        appleButton.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
        
        rowStackView.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(150)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
