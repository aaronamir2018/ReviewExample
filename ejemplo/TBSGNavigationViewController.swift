//
//  TBSGNavigationViewController.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 22/01/24.
//

import UIKit

class TBSGNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        setViewControllers([TBSGTabBarViewController()], animated: false)
    }
}
