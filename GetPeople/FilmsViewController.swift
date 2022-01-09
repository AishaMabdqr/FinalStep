//
//  FilmsViewController.swift
//  GetPeople
//
//  Created by A Ab. on 05/06/1443 AH.
//

import UIKit

class FilmsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var films : [NSDictionary]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        dataModal.getAllFilms(completionHandler: {
            data, response, error in
        
            do {
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                              
                                if let results = jsonResult["results"] as? NSArray {
                                    for film in results {
                                    let filmDict = film as! NSDictionary
                                        self.films?.append(filmDict)
                    
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
        
    }

    
    }
    


extension FilmsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = UITableViewCell()
               cell.textLabel?.text = films?[indexPath.row]["title"] as? String
               return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = films?[indexPath.row]
        performSegue(withIdentifier: "showSegue", sender: person)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let film = sender as? NSDictionary
        let desController = segue.destination as? FilmsDetailsController
        desController?.passedFilm = film
    }
    
    
}
