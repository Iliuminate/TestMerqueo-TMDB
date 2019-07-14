//
//  MovieDetailViewController.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/13/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit


protocol MovieDetailView : class {
    
    func updateTitle(title:String)
    
    func updateDetailMovie(data:(DetailMovieResponse?))
    
    func updateCreditMovie(data:(CreditsResponse?))
    
    func showErrorMessage(error: GeneralBasicResponse?)
}


//----------------------------------------------------------------
//----------------------------------------------------------------
class MovieDetailViewController: UIViewController {

    
    @IBOutlet weak var promotionalImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MovieDetailPresenting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }

}


extension MovieDetailViewController : MovieDetailView {
    
    func updateDetailMovie(data: (DetailMovieResponse?)) {
        print("---------------------")
        print("UpdateDetailMovie")
        print("Data: \(data)")
    }
    
    func updateCreditMovie(data: (CreditsResponse?)) {
        print("---------------------")
        print("UpdateCreditMovie")
        print("Data: \(data)")
    }
    
    
    func updateTitle(title: String) {
        
    }
    
    func showErrorMessage(error: GeneralBasicResponse?) {
        
    }
}
