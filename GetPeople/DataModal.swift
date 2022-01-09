//
//  DataModal.swift
//  GetPeople
//
//  Created by A Ab. on 06/06/1443 AH.
//

import Foundation

class dataModal{
    
    static func getAllPeople(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
            // Specify the url that we will be sending the GET Request to
            let url = URL(string: "https://swapi.dev/api/people/?format=json")
            // Create a URLSession to handle the request tasks
            let session = URLSession.shared
            // Create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getAllPeople function itself
            let task = session.dataTask(with: url!, completionHandler: completionHandler)
            // Actually "execute" the task. This is the line that actually makes the request that we set up above
            task.resume()
        }
    
    static func getAllFilms(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
            // Specify the url that we will be sending the GET Request to
            let url = URL(string: "https://swapi.dev/api/films/?format=json")
            // Create a URLSession to handle the request tasks
            let session = URLSession.shared
            // Create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getAllPeople function itself
            let task = session.dataTask(with: url!, completionHandler: completionHandler)
            // Actually "execute" the task. This is the line that actually makes the request that we set up above
            task.resume()
        }
}
