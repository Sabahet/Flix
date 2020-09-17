//
//  MovieViewController.swift
//  Flix
//
//  Created by Sabahet Alovic on 9/11/20.
//  Copyright © 2020 Sabahet Alovic. All rights reserved.
//

import UIKit
import AlamofireImage


class MovieViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        let synop = movie["overview"] as! String
        let title = movie["title"] as! String
        
        cell.titleLabel.text = title
        cell.synopLabel.text = synop
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let poster = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + poster)
        
        cell.posterView.af_setImage(withURL: posterURL!)

        
        
            return cell
    }
    
    
    
    @IBOutlet var tableView: UITableView!
    
    var movies = [[String:Any]]()
    
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()
        
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
            
            self.tableView.reloadData()
            
            print(dataDictionary)


           }
        }
        task.resume()
        // Do any additional setup after loading the view.
    }
    


}
