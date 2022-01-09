//
//  ViewController.swift
//  GetPeople
//
//  Created by A Ab. on 03/06/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var people : [NSDictionary]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        dataModal.getAllPeople(completionHandler: {
            
        data, response, error in
            do {
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                              
                                if let results = jsonResult["results"] as? NSArray {
                                    for person in results {
                                    let personDict = person as! NSDictionary
                                        self.people?.append(personDict)
                    
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

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = UITableViewCell()
               cell.textLabel?.text = people?[indexPath.row]["name"] as? String
               return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = people?[indexPath.row]
        performSegue(withIdentifier: "showSegue", sender: person)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let person = sender as? NSDictionary
        let desController = segue.destination as? PeopleDetailsController
        desController?.passedPerson = person
    }
    
    
}

