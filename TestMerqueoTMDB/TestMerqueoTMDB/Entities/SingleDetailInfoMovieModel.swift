//
//  SingleDetailInfoMovieModel.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/14/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import Foundation


protocol SingleDetailInfoMovieModelDelegate {
    
    func getTitle() -> String
    func getDescription() -> String
    
    mutating func setTitle(_ txt:String)
    mutating func setDescription(_ txt:String)
}

struct SingleDetailInfoMovieModel : SingleDetailInfoMovieModelDelegate {
    
    var title: String = ""
    var description: String = ""
 
    
    func getTitle() -> String {
        return title
    }
    
    func getDescription() -> String {
        return description
    }
    
    mutating func setTitle(_ txt: String) {
        title = txt
    }
    
    mutating func setDescription(_ txt: String) {
        description = txt
    }
    
    
}
