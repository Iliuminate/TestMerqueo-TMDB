//
//  PopularMovieModelDelegate.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/14/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit


protocol PopularMovieModelDelegate {
    
    /// Get Image Name
    func getImageName() -> String
    
    /// Get movie title
    func getTitle() -> String
    
//    func getUIImage() -> UIImage
//    
//    func setUIImage(image:UIImage)
}
