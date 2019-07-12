//
//  NavigationBuilder.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit


typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
    static func build(rootController: UIViewController) -> UINavigationController {
        
        let textStyleAttributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : UIColor.white
            //,.font : UIFont.init(name: <#T##String#>, size: <#T##CGFloat#>)
        ]
        
        let largeTextStyleAttributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : UIColor.white
            //,.font : UIFont.init(name: <#T##String#>, size: <#T##CGFloat#>)
        ]
        
        
        let navigationController = UINavigationController(rootViewController: rootController)
        
        navigationController.navigationBar.barTintColor = UIColor.black
        navigationController.navigationBar.tintColor = UIColor.white
        navigationController.navigationBar.titleTextAttributes = textStyleAttributes
        navigationController.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
}
