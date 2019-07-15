//
//  UIImageView.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func downloadFrom(link:String?, contentMode mode: UIView.ContentMode) {
        
        contentMode = mode
        //image = UIImage(named: "background")
        
        if let _link = link {
            image = UIImage.getImagebyUserDefaults(key: _link, formatImg: .jpg)            
        } else {
            image = UIImage(named: "background")
        }
        
        
        if link != nil, let url = NSURL(string: link!) {
            URLSession.shared.dataTask(with: url as URL) { data, response, error in
                guard let data = data, error == nil else {
                    print("\nerror on download \(error))")
                    return
                }
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    print("statusCode != 200; \(httpResponse.statusCode)")
                    return
                }
                DispatchQueue.main.async {
                    print("\ndownload completed \(url.lastPathComponent!)")
                    self.image = UIImage(data: data)
                    UIImage.saveImageByUserDefaults(key: link!, image: self.image!, formatImg: .jpg)
                }
                }.resume()
        } else {
            self.image = UIImage(named: "default")
        }
    }
}
