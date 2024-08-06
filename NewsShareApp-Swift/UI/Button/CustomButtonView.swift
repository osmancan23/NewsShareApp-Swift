//
//  CustomButtonView.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 6.08.2024.
//

import UIKit

class CustomButtonView: UIButton {
    
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    private func setupUI(){
        self.setTitleColor(.black, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func setup(title:String)  {
        self.setTitle(title, for: .normal)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


#Preview{
    CustomButtonView()
}
