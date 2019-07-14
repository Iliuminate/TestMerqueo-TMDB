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
    
    func updateMovies(movies:[PopularMovieEntity])
    
    func setupCollectionView()
}

//-------------------------------------------------------------
//-------------------------------------------------------------
class PopularMoviesViewController: UIViewController {

    @IBOutlet weak var labelTest: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private static let popularMoviewIDCell = "MovieCollectionCell"
    
    var presesenter: PopularMoviesPresenting!
    var datasource: [PopularMovieEntity] = [] {
        
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presesenter.viewDidLoad()
        
        let nib = UINib(nibName: PopularMoviesViewController.popularMoviewIDCell, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: PopularMoviesViewController.popularMoviewIDCell)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}


extension PopularMoviesViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let viewItem = datasource[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMoviesViewController.popularMoviewIDCell, for: indexPath) as! MovieCollectionCell
        cell.setup(item: viewItem)
        
        return cell
    }
    
    
}


extension PopularMoviesViewController : PopularMoviesView {
    
    func updateMovies(movies: [PopularMovieEntity]) {
        self.datasource = movies
    }
    
    func setupCollectionView() {
        
    }
    
    func updateTitle(title: String) {
        //labelTest.text = title
    }
}
