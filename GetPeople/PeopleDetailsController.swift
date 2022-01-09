//
//  PeopleDetailsController.swift
//  GetPeople
//
//  Created by A Ab. on 06/06/1443 AH.
//

import UIKit

class PeopleDetailsController: UIViewController {
    
    var passedPerson: NSDictionary!

    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var mass: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = "\(passedPerson["name"]!) Details "
        gender.text = "Gender: \(passedPerson["gender"]!)"
        birthYear.text = "Birth Year: \(passedPerson["birth_year"]!)"
        mass.text = "Mass: \(passedPerson["mass"]!)"
    }
    


}
