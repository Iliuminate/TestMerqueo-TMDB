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

protocol NetworkAPI {
    
    func fetchPopularMovies(response: @escaping PopularMoviesClosure)
}


class NetworkServices {
    
    var controller:UIViewController?
    
    static let shared : NetworkServices = NetworkServices()
    private init(){}
}


extension NetworkServices : NetworkAPI {
   
    
    func fetchPopularMovies(response: @escaping PopularMoviesClosure) {
        
        let network = NetworkManager.init(controller: self.controller)
        let uri = String(format: NetworkPath.api_movies_popular, "1")
        
        network.GET(uriApi: uri, header: nil) {
            
            (result:PopularMoviesResponse?, error:GeneralBasicResponse?) in
            DispatchQueue.main.async {
                print("Call netkwork")
                response(result, error)
            }
            
//            (result:PopularMoviesResponse?, error:GeneralBasicResponse?) in
//            DispatchQueue.main.async {
//                print("Call netkwork")
//                response(result,error)
//            }
        }
    }
}
