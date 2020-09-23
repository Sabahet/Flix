//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Sabahet Alovic on 9/21/20.
//  Copyright © 2020 Sabahet Alovic. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var backDrop: UIImageView!
    
    @IBOutlet weak var synopLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    var movie: [String: Any]!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopLabel.text = movie["overview"] as? String
        synopLabel.sizeToFit()
            let baseURL = "https://image.tmdb.org/t/p/w185"
               let poster = movie["poster_path"] as! String
               let posterURL = URL(string: baseURL + poster)
         posterView.af_setImage(withURL: posterURL!)
        
        let backdrop = movie["backdrop_path"] as! String
                   let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdrop)
             backDrop.af_setImage(withURL: backdropURL!)
        
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
