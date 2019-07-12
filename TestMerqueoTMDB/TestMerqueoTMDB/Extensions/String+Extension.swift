//
//  String+Extension.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import Foundation


extension String {
    
    func removeNULLString() -> String {
        
        var text = self
        text = String(text.replacingOccurrences(of: ":null", with: ":\"\""))
        text = String(text.replacingOccurrences(of: ":<null>", with: ":\"\""))
        text = String(text.replacingOccurrences(of: ":(null)", with: ":\"\""))
        
        return text
    }
    
    
    
    func convertToDictionary() -> [NSDictionary]? {
        
        let text = self
        
        if let data = text.data(using: .utf8) {
            do {
                let obj = try JSONSerialization.jsonObject(with: data, options: [])
                if let dic = obj as? NSDictionary {
                    return [dic]
                } else {
                    return obj as? [NSDictionary]
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return nil
    }
    
}
