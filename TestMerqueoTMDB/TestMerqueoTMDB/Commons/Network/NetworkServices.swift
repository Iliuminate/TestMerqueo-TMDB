//
//  NetworkServices.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/14/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit

//typealias PopularMoviesClosure = (PopularMoviesResponse) -> (Void)
typealias PopularMoviesClosure = (PopularMoviesResponse?, GeneralBasicResponse?) -> (Void)
typealias DetailMoviewClosure = (DetailMovieResponse?, GeneralBasicResponse?) -> (Void)
typealias CreditsClosure = (CreditsResponse?, GeneralBasicResponse?) -> (Void)

protocol NetworkAPI {
    
    func fetchPopularMovies(response: @escaping PopularMoviesClosure)
    func fetchDetailMovie(id:String, response: @escaping DetailMoviewClosure)
    func fetchCreditsMovie(id:String, response: @escaping CreditsClosure)
}


class NetworkServices {
    
    var controller:UIViewController?
    
    static let shared : NetworkServices = NetworkServices()
    private init(){}
}


extension NetworkServices : NetworkAPI {
    
    /// Fetch credits of moview
    func fetchDetailMovie(id:String, response: @escaping DetailMoviewClosure) {
        
        let network = NetworkManager.init(controller: self.controller)
        let uri = String(format: NetworkPath.api_movie_detail, id)
        
        network.GET(uriApi: uri, header: nil) {
            
            (result:DetailMovieResponse?, error:GeneralBasicResponse?) in
            DispatchQueue.main.async {
                print("Call fetchDetailMovie")
                response(result, error)
            }
        }
    }
    
    /// Fetch credits of moview
    func fetchCreditsMovie(id:String, response: @escaping CreditsClosure) {
        
        let network = NetworkManager.init(controller: self.controller)
        let uri = String(format: NetworkPath.api_movie_credits, id)
        
        network.GET(uriApi: uri, header: nil) {
            
            (result:CreditsResponse?, error:GeneralBasicResponse?) in
            DispatchQueue.main.async {
                print("Call fetchCreditsMovie")
                response(result, error)
            }
        }
    }
    
    /// Fetch credits of moview
    func fetchPopularMovies(response: @escaping PopularMoviesClosure) {
        
        let network = NetworkManager.init(controller: self.controller)
        let uri = String(format: NetworkPath.api_movies_popular, "1")
        
        network.GET(uriApi: uri, header: nil) {
            
            (result:PopularMoviesResponse?, error:GeneralBasicResponse?) in
            DispatchQueue.main.async {
                print("Call fetchPopularMovies")
                response(result, error)
            }
        }
    }
}
