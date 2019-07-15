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
    
    func updatePosterImage(image:String)
    
    func updateDetailMovie(data:(DetailMovieResponse?))
    
    func updateCreditMovie(data:(CreditsResponse?))
    
    func showErrorMessage(error: GeneralBasicResponse?)
    
    func setBaseData(baseData:[SingleDetailInfoMovieModelDelegate])
}


//----------------------------------------------------------------
//----------------------------------------------------------------
class MovieDetailViewController: UIViewController {

    
    @IBOutlet weak var promotionalImage: UIImageView!
    
    
    @IBOutlet weak var lb11: UILabel!
    @IBOutlet weak var lb12: UILabel!
    
    @IBOutlet weak var lb21: UILabel!
    @IBOutlet weak var lb22: UILabel!
    
    @IBOutlet weak var lb31: UILabel!
    @IBOutlet weak var lb32: UILabel!
    
    @IBOutlet weak var lb41: UILabel!
    @IBOutlet weak var lb42: UILabel!
    
    
    
    var presenter: MovieDetailPresenting?
    var dataSource:[SingleDetailInfoMovieModelDelegate] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        
        initStyles()
    }
    
    private func initStyles(){
        
        lb11.textColor = UIColor.moviesRed
        lb12.textColor = UIColor.white
        
        lb21.textColor = UIColor.moviesRed
        lb22.textColor = UIColor.white
        
        lb31.textColor = UIColor.moviesRed
        lb32.textColor = UIColor.white
        
        lb41.textColor = UIColor.moviesRed
        lb42.textColor = UIColor.white
    }

}




extension MovieDetailViewController : MovieDetailView {
    
    func updatePosterImage(image:String){
        promotionalImage.downloadFrom(link: image, contentMode: .center)
    }
    
    func setBaseData(baseData: [SingleDetailInfoMovieModelDelegate]) {
        dataSource = baseData
        
        lb11.text = dataSource[0].getTitle()
        lb21.text = dataSource[1].getTitle()
        lb31.text = dataSource[2].getTitle()
        lb41.text = dataSource[3].getTitle()
    }
    
    func updateDetailMovie(data: (DetailMovieResponse?)) {
        print("---------------------")
        print("UpdateDetailMovie")
        //print("Data: \(data)")
        
        dataSource[0].setDescription(data?.overview ?? "") // Summary
        dataSource[3].setDescription(data?.releaseDate ?? "") //Year
        
        lb12.text = data?.overview ?? ""
        lb42.text = data?.releaseDate ?? ""
        
    }
    
    func updateCreditMovie(data: (CreditsResponse?)) {
        print("---------------------")
        print("UpdateCreditMovie")
        //print("Data: \(data)")
        
        if let cast = data?.cast {
            
            var casting = ""
            for ct in cast {
                casting += "\(ct.name), "
            }
            if casting.count > 0 {
                //TODO
                //casting = String(casting.removeLast())
            }
            dataSource[1].setDescription(casting) //Cast
            lb22.text = casting
        }
        
        if let crew = data?.crew {
            if let director = crew.first(where:{$0.job == "Director" }) {
                dataSource[2].setDescription(director.name) //Director ((CREW))
                lb32.text = director.name
            }
        }
    }
    
    
    func updateTitle(title: String) {
        
    }
    
    func showErrorMessage(error: GeneralBasicResponse?) {
        
    }
}
