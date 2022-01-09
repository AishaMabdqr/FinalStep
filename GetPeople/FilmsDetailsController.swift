//
//  FilmsDetailsController.swift
//  GetPeople
//
//  Created by A Ab. on 06/06/1443 AH.
//

import UIKit

class FilmsDetailsController: UIViewController {
    
    var passedFilm : NSDictionary!
    
    @IBOutlet weak var filmTitle: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!
    
    @IBOutlet weak var director: UILabel!
    
   
    @IBOutlet weak var openingCrawl: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filmTitle.text = "\(passedFilm["title"]!) Details "
        releaseDate.text = "Release Date: \(passedFilm["release_date"]!)"
        director.text = "Director: \(passedFilm["director"]!)"
        openingCrawl.text = "Opening Crawl: \(passedFilm["opening_crawl"]!)"
    }
    


}
