//
//  PopularMovieIteractor.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit


protocol PopularMoviesUseCase {
    
    func getTitle() -> String
    
    func getPopularMovies() -> ResponseAPIMoviesPopular?
}

class PopularMoviesInteractor {
    
}


extension PopularMoviesInteractor : PopularMoviesUseCase {
   
    func getPopularMovies() -> ResponseAPIMoviesPopular? {
        
        return nil
    }
   
   
    func getTitle() -> String {
        
        return "Mi titulo personalizado"
    }
    
}

class testClass : ResponseDelegate {
    
    required init?(data: Data) {
        
    }
    
    
}
