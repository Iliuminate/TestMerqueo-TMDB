//
//  PopularMoviesViewController.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit

protocol PopularMoviesView : class {
 
    func updateTitle(title:String)
}


class PopularMoviesViewController: UIViewController {

    @IBOutlet weak var labelTest: UILabel!
    
    
    var presesenter: PopularMoviesPresenting!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presesenter.viewDidLoad()
    }

}

extension PopularMoviesViewController : PopularMoviesView {
    
    func updateTitle(title: String) {
        labelTest.text = title
    }
}
