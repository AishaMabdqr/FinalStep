//
//  FilmsViewController.swift
//  GetPeople
//
//  Created by A Ab. on 05/06/1443 AH.
//

import UIKit

class FilmsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var films : [String]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        let url = URL(string: "https://swapi.dev/api/films/?format=json")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: {
                   // see: Swift closure expression syntax
                   data, response, error in
            do {
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                              
                                if let results = jsonResult["results"] as? NSArray {
                                    for film in results {
                                    let filmDict = film as! NSDictionary
                                        self.films?.append(filmDict["title"]! as! String)
                    
                                    }
                                }
                            }
                                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                        } catch {
                            print(error)
                        }
               })
           
               task.resume()
        
    }

    
    }
    


extension FilmsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = UITableViewCell()
               cell.textLabel?.text = films?[indexPath.row] ?? ""
               return cell
    }
    
    
}
