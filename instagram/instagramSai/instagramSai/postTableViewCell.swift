//
//  postTableViewCell.swift
//  instagramSai
//
//  Created by Saikiran Komatineni on 4/8/19.
//  Copyright © 2019 saikiran. All rights reserved.
//

import UIKit

class postTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imagePost: UIImageView!
    
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var caption: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
