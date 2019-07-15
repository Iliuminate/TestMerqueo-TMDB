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
        let networkServices = NetworkServices.shared
        networkServices.controller = viewController
        
        let router = MovieDetailRouter(viewController: viewController)
        let interactor = MovieDetailInteractor(dataDetail: dataDetail, services: networkServices)
        let presenter = MovieDetailPresenter(view: viewController, interactor: interactor, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
}
