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
}

extension MovieDetailPresenter : MovieDetailPresenting {
    
    
    func viewDidLoad() {
        
        //Set poster image
        self.detailMoviesView?.updatePosterImage(image: self.interactor.getImageName())
        
        //Set base data information struct
        self.detailMoviesView?.setBaseData(baseData: self.interactor.presentData())
        
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.getMovieDetail { (result,error) in
                DispatchQueue.main.async {
                    if let _result = result {
                        self?.detailMoviesView?.updateDetailMovie(data: (_result))
                    } else {
                        print("Error")
                        if let _error = error {
                            self?.detailMoviesView?.showErrorMessage(error: _error)
                        }
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
                        if let _error = error {
                            self?.detailMoviesView?.showErrorMessage(error: _error)
                        }
                    }
                }
            }
        }
    }
    
}
