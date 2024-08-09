import UIKit

protocol DropDownButtonDelegate{
    func didSelect(_ index: Int)
}

class DropDownButton: UIView {

    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pick option", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.2
        button.layer.borderColor = UIColor.gray.cgColor
        return button
    }()

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 4
        stack.axis = .vertical
        return stack
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isHidden = true
        table.layer.borderWidth = 1.2
        table.layer.borderColor = UIColor.gray.cgColor
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cells")
        return table
    }()

    var dataSource: [String] = [] {
        didSet {
            updateTableDataSource()
        }
    }

    var title: String = "" {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }

    var delegate: DropDownButtonDelegate?

    var tableViewHeight: NSLayoutConstraint?

    var buttonHeightConstraint: NSLayoutConstraint?
    var buttonHeight: CGFloat = 40 {
        didSet {
            buttonHeightConstraint?.constant = buttonHeight
            updateTableDataSource()
        }
    }

    var maxVisibleCellsAmount: Int = 4 {
        didSet {
            updateTableDataSource()
        }
    }

    var buttonBottomConstraint: NSLayoutYAxisAnchor {
        button.bottomAnchor
    }

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        addSubview(stackView)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo:topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        buttonHeightConstraint = button.heightAnchor.constraint(equalToConstant: buttonHeight)
        buttonHeightConstraint?.isActive = true
        tableViewHeight = tableView.heightAnchor.constraint(equalToConstant: 0)
        tableViewHeight?.isActive = true
        button.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
    }

    func updateTableDataSource() {
        if dataSource.count >= maxVisibleCellsAmount {
            tableViewHeight?.constant = CGFloat(maxVisibleCellsAmount) * buttonHeight
        } else {
            tableViewHeight?.constant = CGFloat(dataSource.count) * buttonHeight
        }
        tableView.reloadData()
    }

    @objc private func buttonTapped() {
        tableView.isHidden.toggle()
    }

}

extension DropDownButton: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell else { return UITableViewCell() }
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }

}

extension DropDownButton: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        button.setTitle(dataSource[indexPath.row], for: .normal)
        delegate?.didSelect(indexPath.row)
        tableView.isHidden = true
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return buttonHeight
    }
}
