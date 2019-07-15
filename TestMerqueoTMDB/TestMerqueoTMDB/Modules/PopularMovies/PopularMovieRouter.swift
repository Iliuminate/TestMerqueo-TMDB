//
//  PopularMovieRouter.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit

protocol PopularMoviesRouting {
    
    func routeToMovieDetail(dataDetail: PopularMovieEntity)
}

class PopularMoviesRouter {
    
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}

extension PopularMoviesRouter : PopularMoviesRouting {
    
    func routeToMovieDetail(dataDetail: PopularMovieEntity) {
        
        let movieDetault = MovieDetailBuilder.build(dataDetail: dataDetail)
        self.viewController.navigationController?.pushViewController(movieDetault, animated: true)
    }
}
