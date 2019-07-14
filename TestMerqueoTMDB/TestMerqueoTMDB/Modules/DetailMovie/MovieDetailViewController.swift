//
//  MovieDetailViewController.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/13/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit


protocol MovieDetailView {
    
}


class MovieDetailViewController: UIViewController {

    
    @IBOutlet weak var promotionalImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}


extension MovieDetailViewController : MovieDetailView {
    
    
}
