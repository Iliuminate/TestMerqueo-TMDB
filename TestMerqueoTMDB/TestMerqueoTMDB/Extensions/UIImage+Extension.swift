//
//  UIImage+Extension.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/14/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit

extension UIImage {
    
    enum formatImage {
        case jpg
        case png
    }
    
    static func getImagebyUserDefaults(key:String, formatImg:UIImage.formatImage) -> UIImage? {
        
        let defaults = UserDefaults.standard
        let data:Data?
        
        switch formatImg {
        case .jpg:
            data = defaults.object(forKey: key) as? Data
            break
            
        case .png:
            data = defaults.object(forKey: key) as? Data
            break
            
        }
        
        if let imageData = data {
            return UIImage.init(data: imageData) ?? UIImage.init(named: "background")
        } else {
            return UIImage.init(named: "background")
        }
        
    }
    
    static func saveImageByUserDefaults(key:String, image:UIImage, formatImg:UIImage.formatImage){
        
        let imageData:Data?
        let defaults = UserDefaults.standard
        
        switch formatImg {
        case .jpg:
            imageData = image.jpegData(compressionQuality: 1.0)
            break
            
        case .png:
            imageData = image.pngData()
            break
        }
        
        if let data = imageData {
            defaults.set(data, forKey: key)
        }
    }
}
