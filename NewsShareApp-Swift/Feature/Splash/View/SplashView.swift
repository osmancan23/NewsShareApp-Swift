//
//  SplashView.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 12.02.2024.
//

import Foundation
import UIKit
import SnapKit

protocol SplashViewProtocol {
    func onTapGetStartedButton()
}

class SplashView : UIView {
    
    var delegate : SplashViewProtocol?
    
    private lazy var imageView : UIImageView = {
       let image = UIImage(named: "splashImage")
       let imageView = UIImageView(
        image: image)
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
        label.font = UIFont.systemFont(ofSize: 35,weight: .medium)
        
        
        return label
    }()
    
    private lazy var subTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Stay informed with the latest news"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }()
    
    private lazy var buttonWidget : UIButton = {
       let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    
    lazy var action : UIAction = UIAction { _ in
        self.delegate?.onTapGetStartedButton()
    }
    
    init() {
        super.init(frame: .zero)
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        self.addSubview(buttonWidget)
        self.backgroundColor = .white
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
        }
        
        buttonWidget.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(300)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
