//
//  RepresentativeController.swift
//  RepresentativeProject
//
//  Created by Josh Sparks on 10/3/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

import Foundation

class RepresentativeContoller {
    static let baseURL = URL(string: "https://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void) {
        guard let url = baseURL else { completion([]); return}
        
        let stateQuery = URLQueryItem(name: "state", value: state.lowercased())
        let jsonQuery = URLQueryItem(name: "output", value: "json")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [stateQuery, jsonQuery]
        guard let finalURL = components?.url else { completion([]); return }
        print(finalURL)
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("There was a problem getting the representatives")
                completion([])
            return
            }
            guard let data = data,
                let asciiDataString = String(data: data, encoding: .ascii),
                let UTFDataString = asciiDataString.data(using: .utf8)
                else { completion([]); return }
            
            let jsonDecoder = JSONDecoder()
            do {
                let resultsDictionary = try jsonDecoder.decode([String: [Representative]].self, from: UTFDataString)
                let repArray = resultsDictionary["results"]
                completion(repArray ?? [])
            } catch {
                print("Error decoding data \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
