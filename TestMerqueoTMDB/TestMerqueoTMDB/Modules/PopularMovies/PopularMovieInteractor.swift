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
    
    func getPopularMovies(completion: @escaping PopularMoviesClosure)
}

class PopularMoviesInteractor {
    
    var services: NetworkAPI
    init(services: NetworkAPI) {
        self.services = services
    }
    
}


extension PopularMoviesInteractor : PopularMoviesUseCase {
    
    func getPopularMovies(completion: @escaping PopularMoviesClosure) {
        self.services.fetchPopularMovies { (result,error) in
            completion(result,error)
        }
    }
    
   
    func getTitle() -> String {
        
        return "Mi titulo personalizado"
    }
    
}
