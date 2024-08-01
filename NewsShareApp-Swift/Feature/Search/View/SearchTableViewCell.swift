//
//  SearchTableViewCell.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 1.08.2024.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "SearchTableViewCell"
    
    private lazy var image : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "splashImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        return imageView
    }()
    
    private lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Latest News"
        label.font = UIFont.systemFont(ofSize: 16)

        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        contentView.layer.cornerRadius = 16
        
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        
        contentView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(100)
        }
        
        image.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.centerY.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(20)
            make.centerY.equalTo(contentView)
        }
        
       
    }
    
    func setup(title:String)  {
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  

}

#Preview{
    SearchTableViewCell().contentView
}
