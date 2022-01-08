//
//  ViewController.swift
//  GetPeople
//
//  Created by A Ab. on 03/06/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var people : [String]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let url = URL(string: "https://swapi.dev/api/people/?format=json")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: {
                   // see: Swift closure expression syntax
                   data, response, error in
            do {
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                              
                                if let results = jsonResult["results"] as? NSArray {
                                    for person in results {
                                    let personDict = person as! NSDictionary
                                        self.people?.append(personDict["name"]! as! String)
                    
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

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = UITableViewCell()               
               cell.textLabel?.text = people?[indexPath.row] ?? ""
               return cell
    }
    
    
}

