//
//  movieDetailsViewController.swift
//  flix
//
//  Created by Saikiran Komatineni on 2/19/19.
//  Copyright © 2019 saikiran. All rights reserved.
//

import UIKit
import AlamofireImage

class movieDetailsViewController: UIViewController {

    
    @IBOutlet weak var backDropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var titlelabel: UILabel!
    var movie: [String: Any]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlelabel.text = movie["title"] as! String
        titlelabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as! String
        synopsisLabel.sizeToFit()
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let pathURL = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + pathURL)
        
        posterView.af_setImage(withURL: posterURL!)
        
        let backdrop_baseURL = "https://image.tmdb.org/t/p/w780"
        let backdrop_pathURL = movie["poster_path"] as! String
        let backdrop_posterURL = URL(string: backdrop_baseURL + pathURL)
        
        backDropView.af_setImage(withURL: backdrop_posterURL!)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
