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
    @IBOutlet weak var tableView: UITableView!
    
    
    static let movieDetailCellID = "DetailInfoCell"
    
    var presenter: MovieDetailPresenting?
    var dataSource:[SingleDetailInfoMovieModelDelegate] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        
        let nib = UINib.init(nibName: MovieDetailViewController.movieDetailCellID, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MovieDetailViewController.movieDetailCellID)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 36
        
        //Disable scroll
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
    }

}



extension MovieDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    /**  */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    /**  */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieDetailViewController.movieDetailCellID, for: indexPath as IndexPath) as! DetailInfoCell
        
        let data = dataSource[indexPath.row]
        cell.setup(data: data)
        
        return cell
    }
    
    
    /** */
    func setHeightTable() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = true
        
        let heightContent = tableView.contentSize.height
        let yPosition = tableView.frame.origin.y
        let HeightScreen = self.view.bounds.height
        let minimunHeightTableView = HeightScreen-yPosition
        
//        print("YPosition: \(yPosition)")
//        print("HeighScreen: \(HeightScreen)")
//        print("minumHeighTale: \(minimunHeightTableView)")
//        print("heightConten: \(heightContent)")
        
//        if heightContent >= minimunHeightTableView {
//            tableView.frame.size = CGSize.init(width: self.view.bounds.width, height: (heightContent))
//        } else {
//            tableView.frame.size = CGSize.init(width: self.view.bounds.width, height: (minimunHeightTableView))
//        }
        
        tableView.frame.size = CGSize.init(width: self.view.bounds.width, height: (800.0))
        
        self.view.layoutIfNeeded()
        self.view.setNeedsUpdateConstraints()
        self.view.updateConstraintsIfNeeded()
    }
}



extension MovieDetailViewController : MovieDetailView {
    
    func updatePosterImage(image:String){
        promotionalImage.downloadFrom(link: image, contentMode: .center)
    }
    
    func setBaseData(baseData: [SingleDetailInfoMovieModelDelegate]) {
        dataSource = baseData
    }
    
    func updateDetailMovie(data: (DetailMovieResponse?)) {
        print("---------------------")
        print("UpdateDetailMovie")
        //print("Data: \(data)")
        
        dataSource[0].setDescription(data?.overview ?? "") // Summary
        dataSource[3].setDescription(data?.releaseDate ?? "") //Year
        
        tableView.reloadData()
        setHeightTable()
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
        }
        
        if let crew = data?.crew {
            if let director = crew.first(where:{$0.job == "Director" }) {
                dataSource[2].setDescription(director.name ?? "") //Director ((CREW))
            }
        }
        
        tableView.reloadData()
        setHeightTable()
    }
    
    
    func updateTitle(title: String) {
        
    }
    
    func showErrorMessage(error: GeneralBasicResponse?) {
        
    }
}
