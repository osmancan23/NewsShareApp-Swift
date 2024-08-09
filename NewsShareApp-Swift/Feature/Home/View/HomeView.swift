//
//  HomeView.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 12.07.2024.
//

import Foundation
import UIKit

protocol HomeViewProtocol {
    func goToCreateNewsView()
}


class HomeView : UIView {
    
    var delegate : HomeViewProtocol?
    
    let list = ["osman","can","akagündüz","murat","kadir"]
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName:"person.circle.fill")
        return imageView
    }()
    
    private lazy var helloTextView: UILabel = {
        let label = UILabel()
        label.text = "Welcome to NewsShare!"
        return label
    }()
    
    private lazy var rowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var searchField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search News"
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.textColor = .black
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 0.9
        textField.layer.cornerRadius = 8
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    private lazy var popularNewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular News"
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PopularNewsCollectionViewCell.self, forCellWithReuseIdentifier: "PopularNewsCell")
        return collectionView
    }()
    
    private lazy var newReleaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "New releases"
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    private lazy var newReleaseTableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewReleaseTableViewCell.self, forCellReuseIdentifier: NewReleaseTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
   
    lazy var createNewsAction : UIAction = UIAction { _ in
        self.delegate?.goToCreateNewsView()
    }
    
    
    private lazy var createNewsButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.tintColor = .gray
        button.imageView?.contentMode = .scaleAspectFit
        button.addAction(createNewsAction , for: .touchUpInside)
        return button
    }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(rowStackView)
        rowStackView.addArrangedSubview(profileImageView)
        rowStackView.addArrangedSubview(helloTextView)
        
        self.addSubview(searchField)
        self.addSubview(popularNewsLabel)
        self.addSubview(collectionView)
        self.addSubview(newReleaseLabel)
        self.addSubview(newReleaseTableView)
        self.addSubview(createNewsButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        helloTextView.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        rowStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
        }
        
        searchField.snp.makeConstraints { make in
            make.leading.equalTo(rowStackView.snp.leading)
            make.top.equalTo(rowStackView.snp.bottom).offset(30)
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        
        popularNewsLabel.snp.makeConstraints { make in
            make.leading.equalTo(searchField.snp.leading)
            make.top.equalTo(searchField.snp.bottom).offset(30)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(popularNewsLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(popularNewsLabel.snp.bottom).offset(20)
            make.height.equalTo(260)
        }
        
        newReleaseLabel.snp.makeConstraints { make in
            make.leading.equalTo(popularNewsLabel.snp.leading)
            make.top.equalTo(collectionView.snp.bottom).offset(25)
        }
        
        newReleaseTableView.snp.makeConstraints { make in
            make.leading.equalTo(popularNewsLabel.snp.leading)
            make.height.equalToSuperview().offset(-10)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(newReleaseLabel.snp.bottom).offset(20)
        }
        createNewsButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalTo(helloTextView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularNewsCell", for: indexPath) as! PopularNewsCollectionViewCell
        cell.setup(title: list[indexPath.item])
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 260)
    }
}


extension HomeView : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newReleaseTableView.dequeueReusableCell(withIdentifier: NewReleaseTableViewCell.identifier, for: indexPath) as! NewReleaseTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100 // Hücre yüksekliği set ediliyor
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        10
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
           let footerView = UIView()
           footerView.backgroundColor = .clear // Boşluk için arka plan rengi
           return footerView
       }
    
}

#Preview{
    HomeView()
}
