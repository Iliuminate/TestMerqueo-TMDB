//
//  MovieDetailRouter.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/14/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit


protocol MovieDetailRouting {
    
}


class MovieDetailRouter {
    
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}


extension MovieDetailRouter : MovieDetailRouting {
    
}
