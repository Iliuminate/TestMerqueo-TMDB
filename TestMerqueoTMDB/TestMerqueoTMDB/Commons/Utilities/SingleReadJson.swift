//
//  SingleReadJson.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/13/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import Foundation


class SingleReadJson {
    
    static func getJSONRsult<T:ResponseDelegate>(fileName:String) -> T? {
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return T.init(data: data)
                
            } catch {
                return nil
            }
        }
        return nil
    }
    
    
    static func getJSONRsult(jsonName:String) -> NSDictionary? {
        
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                //if let _jsonResult = jsonResult as? Dictionary<String, AnyObject>{
                if let _jsonResult = jsonResult as? NSDictionary {
                    //let person = jsonResult["person"] as? [Any] {
                    return _jsonResult
                }else {
                    return nil
                }
            } catch {
                return nil
            }
        }
        return nil
    }
    
}
