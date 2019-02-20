//
//  moviesTableViewCell.swift
//  flix
//
//  Created by Saikiran Komatineni on 2/18/19.
//  Copyright © 2019 saikiran. All rights reserved.
//

import UIKit

class moviesTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    
    @IBOutlet weak var posterView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
