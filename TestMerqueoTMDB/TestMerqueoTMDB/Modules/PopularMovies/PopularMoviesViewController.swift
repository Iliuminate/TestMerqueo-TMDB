//
//  PopularMoviesViewController.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit

protocol PopularMoviesView : class {

    func updateMovies(movies:[PopularMovieEntity])
    
    func updateMovies(page:Int, movies:[PopularMovieEntity])
    
    func setupCollectionView()
    
    func onMovieSelection(dataDetail: PopularMovieEntity)
    
    func showErrorMessage(error: GeneralBasicResponse)
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
    
    
    func addTouchItemGesture(_ cell:UICollectionViewCell){
        
        let tap = CollectionTapGesture(target: self, action: #selector(handleTapCollection))
        tap.numberOfTapsRequired = 1
        cell.addGestureRecognizer(tap)
        tap.cell = cell
    }
    
    @objc func handleTapCollection(_ sender: CollectionTapGesture) {
        
        print("HandleTapCollection touch")
        if let _cell = sender.cell as? MovieCollectionCell,
            let _data = _cell.dataSource,
            let data = _data as? PopularMovieEntity {
            
            onMovieSelection(dataDetail: data)
        }else {
            print("Is not a cell")
        }
    }
    
    var isToReload:Bool = true
    var localPage = 1
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let  height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            
            if isToReload {
                
                isToReload = false
                
                //- Get next pending page
                self.presesenter.getNextPage(page: (localPage + 1))
            }
        }
    }

}


extension PopularMoviesViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let viewItem = datasource[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMoviesViewController.popularMoviewIDCell, for: indexPath) as! MovieCollectionCell
        //cell.setup(item: viewItem, classType: PopularMovieEntity.self)
        cell.setup(item: viewItem)
        addTouchItemGesture(cell)
        
        return cell
    }
    
}


extension PopularMoviesViewController : PopularMoviesView {
    
    func updateMovies(page: Int, movies: [PopularMovieEntity]) {
        
        isToReload = true
        localPage = page
        if page > 1 {
            for movie in movies {
                datasource.append(movie)
            }
        }
    }
    
    
    func showErrorMessage(error: GeneralBasicResponse) {
        
        let alert = UIAlertController(title: "Error", message: error.statusMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Reintentar", style: .default, handler: {
            _ in
            self.presesenter.viewDidLoad()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: {
            _ in
        }))
        
        self.present(alert, animated: true)
    }
    
    
    func onMovieSelection(dataDetail: PopularMovieEntity) {
        self.presesenter.onMovieSelection(dataDetail: dataDetail)
    }
    
    /// Update movies data source
    func updateMovies(movies: [PopularMovieEntity]) {
        self.datasource = movies
    }
    
    /// Set collection view format
    func setupCollectionView() {
        
        collectionView.backgroundColor = UIColor.black
        
        let horizontalMargin:Double = 2.0
        let columNumbers:Int = 3
        let itemSize = (Double(UIScreen.main.bounds.width) / Double(columNumbers) - (horizontalMargin * 2.0))
        let heightSize = Double(UIScreen.main.bounds.width) * 0.48//180.0
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: heightSize)
        
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6
        
        
        collectionView.collectionViewLayout = layout
    }
    
}


class CollectionTapGesture: UITapGestureRecognizer {
    
    var cell:UICollectionViewCell?
}
