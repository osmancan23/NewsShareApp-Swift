//
//  ProfileViewController.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 12.07.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileBackgroundImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleToFill
       return imageView
    }()
    
    private lazy var avatarCircleImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "avatarImage")
        imageView.contentMode = .scaleToFill
       return imageView
    }()
    
    private lazy var nameSurnameLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "John Doe"
        return label
    }()
    
    private lazy var jobLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Journalist, Writer, Editor"
        return label
    }()
    
    private lazy var articleCountLabel : UIView = {
       let label = UserCountStackView()
        label.setup(count: "134", subtitle: "Articles")
        
        return label
    }()
    
    private lazy var followerCountLabel : UIView = {
       let label = UserCountStackView()
        label.setup(count: "1.3K", subtitle: "Followers")
        
        return label
    }()
    
    private lazy var followingCountLabel : UIView = {
       let label = UserCountStackView()
        label.setup(count: "1K", subtitle: "Following")
        
        return label
    }()
    
    private lazy var horizontalStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        stackView.distribution = .fillEqually
       
        return stackView
        
    }()
    
    private lazy var followButton : UIButton = {
        let button = CustomButtonView()
        button.setup(title: "Follow")
        
        return button
        
    }()
    
    private lazy var sendMessageButton : UIButton = {
        let button = CustomButtonView()
        button.setup(title: "Send Message")
        
        return button
        
    }()
    
    private lazy var buttonStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var newsTableLabelView : UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "News"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var newsTableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewReleaseTableViewCell.self, forCellReuseIdentifier: NewReleaseTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Profile"
        self.view.backgroundColor = .white
        
        self.view.addSubview(profileBackgroundImageView)
        self.view.addSubview(avatarCircleImageView)
        self.view.addSubview(nameSurnameLabel)
        self.view.addSubview(jobLabel)
        
        self.horizontalStackView.addArrangedSubview(articleCountLabel)
        self.horizontalStackView.addArrangedSubview(followerCountLabel)
        self.horizontalStackView.addArrangedSubview(followingCountLabel)
        
        
        self.view.addSubview(horizontalStackView)
        
    
        
        self.buttonStackView.addArrangedSubview(followButton)
        self.buttonStackView.addArrangedSubview(sendMessageButton)
        
        self.view.addSubview(buttonStackView)
        
        self.view.addSubview(newsTableLabelView)
        
        self.view.addSubview(newsTableView)
        
        profileBackgroundImageView.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        
        avatarCircleImageView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.top.equalTo(profileBackgroundImageView.snp.bottom).offset(10)
            make.leading.equalTo(16)
        }
        
        nameSurnameLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarCircleImageView.snp.trailing).offset(20)
            make.top.equalTo(avatarCircleImageView.snp.top).offset(20)
        }
        
        jobLabel.snp.makeConstraints { make in
            make.top.equalTo(nameSurnameLabel.snp.bottom).offset(10)
            make.leading.equalTo(nameSurnameLabel.snp.leading)
        }
        
        
        
        horizontalStackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            
            make.top.equalTo(avatarCircleImageView.snp.bottom).offset(60)
        }
        
        sendMessageButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(horizontalStackView.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        newsTableLabelView.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(24)
            make.leading.equalTo(buttonStackView)
        }
        
        newsTableView.snp.makeConstraints { make in
            make.top.equalTo(newsTableLabelView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalToSuperview().offset(-20)
        }
        
        
        
    }
    

    
}

extension ProfileViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: NewReleaseTableViewCell.identifier, for: indexPath) as! NewReleaseTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100 // Hücre yüksekliği set ediliyor
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        10
    }
    
}

#Preview{
    ProfileViewController()
}
