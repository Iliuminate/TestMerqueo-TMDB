//
//  PopularMoviesBuidler.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit


protocol PopularMoviesView {
    
}


class PopularMoviesBuidler {
    
    static func build(usingNavigationFactory factory:NavigationFactory) -> UINavigationController {
        
        
        let viewController = PopularMoviesViewController()
        viewController.title = "Popular Movies"
        
        let router = PopularMoviesRouter()
        let interactor = PopularMoviesInteractor()
        let presenter = PopularMoviesPresenter()
        
        return factory(viewController)
    }
    
//    /// Go to RegisterCodeValidator
//    func gotoNextView(){
//
//        let viewController = PopularMoviesBuidler()
//
//        if let appDelegate = UIApplication.shared.delegate {
//            if let window = appDelegate.window {
//
//                window!.rootViewController = nil
//
//                let mainNavigation = NavigationController()
//
//                mainNavigation.viewControllers = [viewController]
//                window!.rootViewController = mainNavigation
//            }
//        }
//    }
}


extension PopularMoviesViewController : PopularMoviesView {
    
}
