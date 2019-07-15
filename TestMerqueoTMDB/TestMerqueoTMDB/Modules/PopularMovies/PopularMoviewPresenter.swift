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
    
    func getNextPage(page:Int)
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
    
    
    func getNextPage(page:Int){
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.getPopularMovies(page:page) { (result,error) in
                DispatchQueue.main.async {
                    
                    if let _result = result {
                        self?.popularMoviesView?.updateMovies(page: _result.page, movies: _result.results)
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
    
    
}
