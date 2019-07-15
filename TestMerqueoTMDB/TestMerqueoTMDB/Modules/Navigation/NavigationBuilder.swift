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
            .foregroundColor : UIColor.moviesRed
            //,.font : UIFont.init(name: "Papyrus", size: 21)!
        ]
        
        let largeTextStyleAttributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : UIColor.moviesRed
            //,.font : UIFont.init(name: "Rockwell-Bold", size: 28)!
        ]
        
        
        let navigationController = UINavigationController(rootViewController: rootController)
        
        navigationController.navigationBar.barTintColor = UIColor.black
        navigationController.navigationBar.tintColor = UIColor.moviesRed
        navigationController.navigationBar.titleTextAttributes = textStyleAttributes
        navigationController.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
}
