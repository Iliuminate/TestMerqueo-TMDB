//
//  MovieDetailBuilder.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/14/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit

class MovieDetailBuilder {
    
    static func build(dataDetail: PopularMovieEntity) -> UIViewController {
        
        
        let viewController = MovieDetailViewController()
        viewController.title = dataDetail.title
        
//        let router = PopularMoviesRouter(viewController: viewController)
//        let interactor = PopularMoviesInteractor(services: networkServices)
//        let presenter = PopularMoviesPresenter(view: viewController, interactor: interactor, router: router)
//        viewController.presesenter = presenter
        
        return viewController
    }
}
