//
//  SearchViewController.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 12.07.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    var categoryList = ["Latest News","Top Stories","Trending Topics","Local News"]
    
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
    
    private lazy var searchTableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SearchTableViewCell.self
                           , forCellReuseIdentifier: SearchTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search"
        self.view.backgroundColor = .white
        
        view.addSubview(searchField)
        view.addSubview(searchTableView)
        
        setupConstraints()
    }
    

    func setupConstraints()  {
        searchField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        
        searchTableView.snp.makeConstraints { make in
            make.leading.equalTo(searchField.snp.leading)
            make.top.equalTo(searchField.snp.bottom).offset(20)
            make.width.equalTo(350)
            make.bottom.equalToSuperview()
        }
    }
    
    private func updateTableViewHeight() {
            let tableViewHeight = searchTableView.contentSize.height
            searchTableView.snp.updateConstraints { make in
                make.height.equalTo(tableViewHeight)
            }
        }
}

extension SearchViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        cell.setup(title: categoryList[indexPath.row])
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
    SearchViewController()
}
