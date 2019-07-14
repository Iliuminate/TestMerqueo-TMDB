//
//  PopularMoviewPresenter.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit


protocol PopularMoviesPresenting {
    
    func viewDidLoad() -> Void
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
        
        //Agregamos la presentación desde el interactor
        let interactorTitle = self.interactor.getTitle()
        print("Interacto get: \(interactorTitle)")
        
        popularMoviesView?.updateTitle(title: interactorTitle)
    }
    
}
