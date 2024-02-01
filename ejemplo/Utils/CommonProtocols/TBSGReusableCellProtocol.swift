//
//  TBSGReusableCellProtocol.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 30/01/24.
//

import UIKit

protocol TBSGReusableCellProtocol {
    static var reuseIdentifier: String { get }
    static var nibName: UINib { get }
}

extension TBSGReusableCellProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
