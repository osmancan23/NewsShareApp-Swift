//
//  NewReleaseTableViewCell.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 25.07.2024.
//

import UIKit

class NewReleaseTableViewCell: UITableViewCell {
    
    static let identifier = "NewReleaseTableViewCell"
    
    private lazy var image : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "splashImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tech Trends"
        label.font = UIFont.systemFont(ofSize: 16)

        return label
    }()
    
    private lazy var subtitleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "by John Doe"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var ratingLabel : UILabel = {
        let label = UILabel()
              label.font = UIFont.systemFont(ofSize: 14)
              label.textColor = .darkGray
              return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .gray.withAlphaComponent(0.2)
        
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(ratingLabel)
        ratingLabel.text = String(repeating: "⭐️", count: 5)

        contentView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(90)
            make.top.equalTo(20)
        }
        
        image.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(contentView.snp.height)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.leading.equalTo(image.snp.trailing).offset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(-10)
            make.trailing.equalTo(contentView).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

#Preview{
    NewReleaseTableViewCell().contentView
}
