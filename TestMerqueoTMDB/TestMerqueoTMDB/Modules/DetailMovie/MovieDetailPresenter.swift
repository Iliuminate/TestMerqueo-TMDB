//
//  MovieDetailPresenter.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/14/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import Foundation


protocol MovieDetailPresenting {
    
    func viewDidLoad() -> (Void)
}


//------------------------------------------------------------
//------------------------------------------------------------
class MovieDetailPresenter{
    
    weak var detailMoviesView: MovieDetailView?
    var interactor: MovieDetailUseCase
    var router: MovieDetailRouting
    
    init(view: MovieDetailView, interactor: MovieDetailUseCase, router: MovieDetailRouting) {
        self.detailMoviesView = view
        self.interactor = interactor
        self.router = router
    }
    
    var fullDataDetail:FullDetailMovieData?
}

extension MovieDetailPresenter : MovieDetailPresenting {
    
    
    func viewDidLoad() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.getMovieDetail { (result,error) in
                DispatchQueue.main.async {
                    if let _result = result {
                        self?.detailMoviesView?.updateDetailMovie(data: (_result))
                    } else {
                        print("Error")
                        self?.detailMoviesView?.showErrorMessage(error: error)
                    }
                }
            }
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.getCreditsMovie { (result,error) in
                DispatchQueue.main.async {
                    if let _result = result {
                        self?.detailMoviesView?.updateCreditMovie(data: (_result))
                    } else {
                        print("Error")
                        self?.detailMoviesView?.showErrorMessage(error: error)
                    }
                }
            }
        }
    }
    
}
