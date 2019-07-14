//
//  MovieDetailInteractor.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/14/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import Foundation


typealias FullDetailMovieData = (DetailMoviewClosure, CreditsClosure)

protocol MovieDetailUseCase {
    
    func getTitle() -> String
    
    func presentData(dataSource: PopularMovieEntity) -> (Void)
    
    func getMovieDetail(completion: @escaping DetailMoviewClosure)
    func getCreditsMovie(completion: @escaping CreditsClosure)
}


class MovieDetailInteractor {
    
    var services: NetworkAPI
    var idMovie:String
    
    init(id:String, services: NetworkAPI) {
        self.services = services
        self.idMovie = id
    }
}


extension MovieDetailInteractor : MovieDetailUseCase {
    
    func getMovieDetail(completion: @escaping DetailMoviewClosure) {
        self.services.fetchDetailMovie(id: idMovie) { (result,error) in
            completion(result,error)
        }
    }
    
    func getCreditsMovie(completion: @escaping CreditsClosure) {
        self.services.fetchCreditsMovie(id: idMovie) { (result,error) in
            completion(result,error)
        }
    }
    
    func presentData(dataSource: PopularMovieEntity) {
        
    }
    
    func getTitle() -> String {
        return ""
    }
    
}
