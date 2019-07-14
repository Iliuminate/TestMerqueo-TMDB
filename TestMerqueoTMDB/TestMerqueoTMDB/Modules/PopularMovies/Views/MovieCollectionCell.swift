//
//  MovieCollectionCell.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/13/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {

    
    
    @IBOutlet weak var posterMovie: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(item: PopularMovieModelDelegate){
        
        print("Item Name: \(item.getTitle())")
        posterMovie.downloadFrom(link: item.getImageName(), contentMode: .scaleAspectFit)
    }


}
