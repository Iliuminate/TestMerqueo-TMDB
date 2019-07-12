//
//  ViewController.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testGETMovies()
    }

    
    func testGETMovies(){
        
        let network = NetworkManager.init(controller: self)
        let uri = String(format: NetworkPath.api_movies_popular, "1")
        
        network.GET(uriApi: uri, header: nil) {
            (response:GeneralBasicResponse?, error:GeneralBasicResponse?) in
            
            DispatchQueue.main.async {
                print("Call netkwork")
            }
        }
    }

}

