//
//  UserCountStackView.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 5.08.2024.
//

import UIKit

class UserCountStackView: UIView {
    
    
   
    private lazy var countLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "134"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var subtitleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Article"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var stackView : UIStackView = {
      let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        
        return stackView
    }()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.addSubview(countLabel)
        stackView.addSubview(subtitleLabel)
        
        self.addSubview(stackView)
        
       
        
        countLabel.snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(10)
                    make.centerX.equalToSuperview()
                }

                subtitleLabel.snp.makeConstraints { make in
                    make.top.equalTo(countLabel.snp.bottom).offset(5)
                    make.centerX.equalToSuperview()
                    make.bottom.equalToSuperview().offset(-10)
                }
            
       
        
        
        
        
        stackView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(count:String, subtitle: String)  {
        subtitleLabel.text = subtitle
        countLabel.text = count
    }
    
}

#Preview{
    UserCountStackView()
}
