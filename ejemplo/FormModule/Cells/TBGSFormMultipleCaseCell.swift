//
//  TBGSFormMultipleCaseCell.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 31/01/24.
//

import UIKit

class TBGSFormMultipleCaseCell: UITableViewCell {
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        contentView.addSubview(stackView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0)
        ])
    }

    func setUpCell(withModel model: TBGSFormMultipleCaseDataModel) {
        for stackV in stackView.subviews {
            stackV.removeFromSuperview()
        }
        
        for item in model.optionsData {
            let select = TBSGSelectionView(model: item)
            stackView.addArrangedSubview(select)
        }
    }
}
