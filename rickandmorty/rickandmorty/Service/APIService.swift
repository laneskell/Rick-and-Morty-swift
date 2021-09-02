//
//  APIService.swift
//  rickandmorty
//
//  Created by Kell Lanes on 29/08/21.
//

import Foundation

class APIService {
    
    class func getCharacteres(completionHandler: @escaping (Data?, Error?, _ response: [CharacterModel]) -> Void) {
        
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching data. \(error)")
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let results = try decoder.decode(Results.self, from: data)
                    completionHandler(data, error, results.results)
                } catch {
                    print("Error decoding data. \(error)")
                }
            }
        }
        
        task.resume()
    }
}
