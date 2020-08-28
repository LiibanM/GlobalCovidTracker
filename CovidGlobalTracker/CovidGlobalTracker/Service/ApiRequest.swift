//
//  ApiRequest.swift
//  CovidGlobalTracker
//
//  Created by Liiban Mukhtar on 23/08/2020.
//  Copyright © 2020 Liiban Mukhtar. All rights reserved.
//

// Holidays -> AllCountry
//holidayDetails -> countryDetail

import Foundation
//
//enum CovidAPIErrors:Error {
//    case noDataAvailable
//    case canNotProcessData
//}
var listOfCountries = [CountriesDetail]()
class ApiRequest{
    

    
//    func getAllCountries(completion: @escaping(Result<[CountriesDetail], CovidAPIErrors>) -> Void){
//
//        guard let url = URL(string: "https://api.covid19api.com/summary") else {
//                    fatalError("Url failed")
//        }
//
//        let dataTask = URLSession.shared.dataTask(with: url) {data, _, _ in
//            guard let  jsonData = data else{
//                completion(.failure(.noDataAvailable))
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let countriesData = try decoder.decode(AllCountry.self, from: jsonData)
//                let countryDetails = countriesData.Countries
//                completion(.success(countryDetails))
//                //print(countryDetails)
//            }catch{
//                completion(.failure(.canNotProcessData))
//            }
//        }
//        dataTask.resume()
//    }
    
    
    
    
    
    

   
}

