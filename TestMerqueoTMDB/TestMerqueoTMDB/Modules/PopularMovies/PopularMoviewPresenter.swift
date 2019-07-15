//
//  PopularMoviewPresenter.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit


protocol PopularMoviesPresenting {
    
    func viewDidLoad() -> (Void)
    
    func onMovieSelection(dataDetail: PopularMovieEntity) -> (Void)
}

class PopularMoviesPresenter {
    
    weak var popularMoviesView:PopularMoviesView?
    var interactor: PopularMoviesUseCase
    var router: PopularMoviesRouting
    
    init(view: PopularMoviesView, interactor: PopularMoviesUseCase, router: PopularMoviesRouting) {
        self.popularMoviesView = view
        self.interactor = interactor
        self.router = router
    }
}

extension PopularMoviesPresenter : PopularMoviesPresenting {
   
    
    func viewDidLoad() {
        
        let interactorTitle = self.interactor.getTitle()
        popularMoviesView?.updateTitle(title: interactorTitle)
        
        popularMoviesView?.setupCollectionView()
        
                
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.getPopularMovies { (result,error) in
                DispatchQueue.main.async {
                    
                    if let _result = result {
                        self?.popularMoviesView?.updateMovies(movies: _result.results)
                    } else {
                        print("Error")
                        if let _error = error {
                            self?.popularMoviesView?.showErrorMessage(error: _error)
                        }
                    }
                }
            }
        }
    }
    
    func onMovieSelection(dataDetail: PopularMovieEntity) {
        self.router.routeToMovieDetail(dataDetail: dataDetail)
    }
    
    
}
