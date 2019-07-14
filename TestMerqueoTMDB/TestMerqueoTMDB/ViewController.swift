//
//  ViewController.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageTest: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testGETMovies()
        testGetImage(imgName: "A32wmjrs9Psf4zw0uaixF0GXfxq.png")
    }

    
    func testGETMovies(){
        
        let network = NetworkManager.init(controller: self)
        let uri = String(format: NetworkPath.api_movies_popular, "1")
        
        network.GET(uriApi: uri, header: nil) {
            (response:ResponseAPIMoviesPopular?, error:GeneralBasicResponse?) in
            
            DispatchQueue.main.async {
                print("Call netkwork")
            }
        }
    }

    
    func testGetImage(imgName:String){
        
        let imageUri = String(format:NetworkPath.base_url_images, "original", imgName)
        imageTest.downloadFrom(link: imageUri, contentMode: .scaleAspectFit)
    }
    
}

