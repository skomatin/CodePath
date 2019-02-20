//
//  ViewController.swift
//  flix
//
//  Created by Saikiran Komatineni on 2/15/19.
//  Copyright © 2019 saikiran. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var mytableView: UITableView!
    var movies = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getData()
        self.mytableView.dataSource = self
        self.mytableView.delegate = self
    }

    func getData() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                print(dataDictionary)
                self.mytableView.reloadData()
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableView.dequeueReusableCell(withIdentifier: "MovieCell") as! moviesTableViewCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let pathURL = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + pathURL)
        
        cell.posterView.af_setImage(withURL: posterURL!)
        
        cell.titleLabel.text = title
        cell.contentLabel.text = synopsis
        return cell
    }
    
    
}


