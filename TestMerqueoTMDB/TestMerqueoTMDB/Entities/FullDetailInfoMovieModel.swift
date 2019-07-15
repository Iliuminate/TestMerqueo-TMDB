//
//  FullDetailInfoMovie.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/14/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import Foundation



protocol DetailInfoStructDelegate {
 
    func getTlSummary() -> String
    func getSummary() -> String
    func getTlCast() -> String
    func getCast() -> String
    func getTlDirector() -> String
    func getDirector() -> String
    func getTlYear() -> String
    func getYear() -> String
}

struct FullDetailInfoMovieModel : DetailInfoStructDelegate {
    
    var TlSummary:String
    var Summary:String
    var TlCast:String
    var Cast:String
    var TlDirector:String
    var Director:String
    var TlYear:String
    var Year:String
    
    
    func getTlSummary() -> String {
        return TlSummary
    }
    
    func getSummary() -> String {
        return Summary
    }
    
    func getTlCast() -> String {
        return TlCast
    }
    
    func getCast() -> String {
        return Cast
    }
    
    func getTlDirector() -> String {
        return TlDirector
    }
    
    func getDirector() -> String {
        return Director
    }
    
    func getTlYear() -> String {
        return TlYear
    }
    
    func getYear() -> String {
        return Year
    }

}
