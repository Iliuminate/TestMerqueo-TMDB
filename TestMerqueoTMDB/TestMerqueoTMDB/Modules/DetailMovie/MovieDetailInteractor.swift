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
    func getImageName() -> String
    
    func presentData() -> [SingleDetailInfoMovieModelDelegate]
    
    func getMovieDetail(completion: @escaping DetailMoviewClosure)
    func getCreditsMovie(completion: @escaping CreditsClosure)
}


class MovieDetailInteractor {
    
    var services: NetworkAPI
    var idMovie:String
    var dataDetail:PopularMovieEntity
    
    init(dataDetail:PopularMovieEntity, services: NetworkAPI) {
        self.services = services
        self.idMovie = String(dataDetail.id)
        self.dataDetail = dataDetail
    }
}


extension MovieDetailInteractor : MovieDetailUseCase {
    
    func presentData() -> [SingleDetailInfoMovieModelDelegate] {
        
        var dataInfo:[SingleDetailInfoMovieModel] = []
        
        dataInfo.append(SingleDetailInfoMovieModel.init(title: "Summary", description: ""))
        dataInfo.append(SingleDetailInfoMovieModel.init(title: "Cast", description: ""))
        dataInfo.append(SingleDetailInfoMovieModel.init(title: "Director", description: ""))
        dataInfo.append(SingleDetailInfoMovieModel.init(title: "Year", description: ""))
        
        return dataInfo
    }
    
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
    
    func getTitle() -> String {
        return ""
    }
    
    func getImageName() -> String {
        return self.dataDetail.getImageName("w500")
    }
    
}
