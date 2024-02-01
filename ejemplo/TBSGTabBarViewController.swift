//
//  TBSGTabBarViewController.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 23/01/24.
//

import UIKit

class TBSGTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    func setUp() {
        tabBar.backgroundColor = .white
        var tabBarViewControllers: [UIViewController] = []
        
        var viewCount = 0
        while viewCount <= 3 {
            let tag: Int = viewCount
            var color: UIColor = .blue
            switch viewCount {
            case 1:
                color = .red
            case 2:
                color = .cyan
            case 3:
                color = .magenta
            case 4:
                color = .yellow
            default:
                break
            }
            
            let viewController = UIViewController()
            viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: tag)
            viewController.tabBarItem.badgeValue = String(tag)
            viewController.view.backgroundColor = color
            tabBarViewControllers.append(viewController)
            viewCount += 1
        }
        
        let formViewController = TBSGFormViewController()
        formViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 5)
        formViewController.tabBarItem.badgeValue = String(5)
        formViewController.view.backgroundColor = .blue
        tabBarViewControllers.append(formViewController)
        
        
        
        setViewControllers(tabBarViewControllers, animated: false)
    }
    
}
