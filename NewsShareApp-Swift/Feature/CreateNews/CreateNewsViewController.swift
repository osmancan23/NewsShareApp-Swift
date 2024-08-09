//
//  CreateNewsViewController.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 7.08.2024.
//

import UIKit

class CreateNewsViewController: UIViewController {
    var imagePicker = UIImagePickerController()
    
    private lazy var imageView : UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red.withAlphaComponent(0.2)
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onClickImageView(tapGestureRecognizer: )))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
        return imageView
    }()
    
    private lazy var titleTextField : UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .gray.withAlphaComponent(0.1)
        field.placeholder = "Enter Title"
        field.borderStyle = .roundedRect
       
        return field
    }()
    
   @objc func onClickImageView(tapGestureRecognizer: UITapGestureRecognizer)  {
       
    
       if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
           print("Button capture")

           imagePicker.delegate = self
           imagePicker.sourceType = .savedPhotosAlbum
           imagePicker.allowsEditing = false

           present(imagePicker, animated: true, completion: nil)
       }
    }
    
    private lazy var descTextField : UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .gray.withAlphaComponent(0.1)
        field.placeholder = "Enter Content"
        field.borderStyle = .roundedRect
        return field
    }()
    
    private lazy var shareButton : UIButton = {
       let button = CustomButtonView()
        button.setup(title: "Share")
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(titleTextField)
        view.addSubview(descTextField)
        view.addSubview(shareButton)
        
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.width.equalTo(120)
            make.height.equalTo(120)
            make.centerX.equalToSuperview()
        }
        
        titleTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
            make.top.equalTo(imageView.snp.bottom).offset(50)
        }
        
        descTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(titleTextField)
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.height.equalTo(250)
        }
        
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(descTextField.snp.bottom).offset(50)
            make.width.equalTo(descTextField)
            make.leading.equalTo(descTextField)
            make.height.equalTo(60)
        }
        
    }
    

    

}

extension CreateNewsViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        imageView.image = image
    }
    
    
}


#Preview{
    CreateNewsViewController()
}
