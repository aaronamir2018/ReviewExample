//
//  TBSGFormTextInputCell.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 29/01/24.
//

import UIKit
class TBSGFormTextInputCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = ""
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 6)
        label.text = ""
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 0.5
        textField.placeholder = ""
        textField.textColor = .blue
        textField.font = UIFont.boldSystemFont(ofSize: 8)
        textField.text = ""
        textField.textAlignment = .left
        textField.borderStyle = .line
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUi()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUi() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(inputTextField)
        contentView.addSubview(warningLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            
            inputTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5.0),
            inputTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            inputTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
        
            warningLabel.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 5.0),
            warningLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            warningLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            warningLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0)
        ])
    }
    
    func setUpCell(withModel model: TBSGFormTextInputDataModel) {
        titleLabel.text = model.title ?? ""
        inputTextField.placeholder = model.placeholder ?? ""
        warningLabel.text = model.defaultWarningMessage ?? ""
    }
}
