//
//  NetworkPath.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import Foundation


struct NetworkPath {
    
    static let base_url = "https://api.themoviedb.org/3"
    static let base_url_scheme = "https"
    static let base_url_host = "api.themoviedb.org/3"
    private static let api_key = "0654b0b2075531e4ae5885f658b9f981"
    
    
    /// Base url movie, requiere "id_movie" and "api_key"
    static let api_movies = "/movie/‰@?api_key=\(api_key)"
    
    /// Base url movie, requiere "id_movie" and "api_key"
    static let api_movies_popular = "/movie/popular?api_key=\(api_key)&language=en-US&page=%@"
    
    /// Movie Detail, requiere "id_movie" and "api_key"
    static let api_movie_detail = "/movie/%@?api_key=\(api_key)"
    
    /// Movies Credits, requiere "id_movie" and "api_key"
    static let api_movie_credits = "/movie/%@/credits?api_key=\(api_key)"
    
    /// Base url image, requiere "file_size", "file_path"
    static let base_url_images = "https://image.tmdb.org/t/p/%@/%@"
    
    /// Base url movie, requiere "id_movie", "api_key", "language"
    //static let base_url_movie_detail = "\(base_url)/movie/%@?api_key=%@&language=en-US"    
}
