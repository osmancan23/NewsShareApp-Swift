import UIKit

class PopularNewsCollectionViewCell: UICollectionViewCell {
    
    let width : Int = 200
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "Latest news updates"
        return label
    }()
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "splashImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.backgroundColor = .gray.withAlphaComponent(0.2)
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(260)
            make.width.equalTo(width)
            make.edges.equalToSuperview().inset(8)
        }
        
        
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(title: String) {
        titleLabel.text = title
    }
}

#Preview{
    PopularNewsCollectionViewCell().contentView
}
