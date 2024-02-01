//
//  TBSGFormDownInputCell.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 31/01/24.
//

import UIKit

protocol TBSGFormDownInputCellProtocol: AnyObject {
    func buttonPressed()
}

class TBSGFormDownInputCell: UITableViewCell {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = ""
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = ""
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var downButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.addTarget(self, action:#selector(self.pressButton), for: .touchUpInside)

        return button
    }()
    
    weak var delegate: TBSGFormDownInputCellProtocol!
    
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
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(downButton)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            titleLabel.trailingAnchor.constraint(equalTo: downButton.leadingAnchor, constant: -20.0),
            
            downButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            downButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            downButton.heightAnchor.constraint(equalToConstant: 30),
            downButton.widthAnchor.constraint(equalToConstant: 30),

            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            subTitleLabel.trailingAnchor.constraint(equalTo: downButton.leadingAnchor, constant: -20.0),
        ])
    }
    
    func setUpCell(withModel model: TBGSFormDownInputDataModel) {
        titleLabel.text = model.title ?? ""
    }
    
    @objc func pressButton() {
        delegate.buttonPressed()
    }
}
