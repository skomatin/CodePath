//
//  FeedViewController.swift
//  
//
//  Created by Saikiran Komatineni on 4/8/19.
//

import UIKit
import Parse
import AlamofireImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posts = [PFObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! postTableViewCell
        print(self.posts.count)
        let post = self.posts[indexPath.row]
        let user = post["author"] as! PFUser
        
        cell.user.text = user.username
        cell.caption.text = post["caption"] as! String
        
        let file = post["image"] as! PFFileObject
        let urlString = file.url!
        let url = URL(string: urlString)!
        cell.imagePost.af_setImage(withURL: url)
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if (posts != nil) {
                self.posts = posts!
                print("reloading table")
                self.tableView.reloadData()
                print(self.posts.count)
            }
        }
        print("outside function", self.posts.count)
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
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
