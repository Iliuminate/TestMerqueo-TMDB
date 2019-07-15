//
//  DetailInfoCell.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/14/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import UIKit

class DetailInfoCell: UITableViewCell {

    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupStyle()
    }
    
    private func setupStyle(){
        lbTitle.textColor = UIColor.red
        lbDescription.textColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setup(data: SingleDetailInfoMovieModelDelegate){
        
        lbTitle.text = data.getTitle()
        lbDescription.text = data.getDescription()
    }
    
}
