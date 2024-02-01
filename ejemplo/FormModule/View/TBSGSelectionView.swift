//
//  TBSGSelectionView.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 1/02/24.
//

import UIKit

class TBSGSelectionView: UIView {
    
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
    
    private lazy var checkView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    init(model: TBGSFormSelectableOption) {
        super.init(frame: CGRectZero)
        setUpView()
        setUpConstraints()
        titleLabel.text = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setUpView(){
        addSubview(titleLabel)
        addSubview(checkView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            checkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),
            checkView.heightAnchor.constraint(equalToConstant: 30.0),
            checkView.widthAnchor.constraint(equalToConstant: 30.0),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            titleLabel.leadingAnchor.constraint(equalTo: checkView.trailingAnchor, constant: 10.0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0),

        ])
    }
}
