//
//  ShowAllCountryModel.swift
//  CovidGlobalTracker
//
//  Created by Liiban Mukhtar on 23/08/2020.
//  Copyright © 2020 Liiban Mukhtar. All rights reserved.
//

import Foundation

// MARK: - Country



struct AllCountry: Codable{
    var Countries: [CountriesDetail]
}

struct CountriesDetail: Codable {
    var Country: String
    var NewConfirmed: Int
    var TotalConfirmed: Int
    var TotalDeaths: Int
    var CountryCode: String
}


//struct Countries: Codable {
//    let country, countryCode, slug: String
//    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int
//    let newRecovered, totalRecovered: Int
//    let date: Date
//
//    enum CodingKeys: String, CodingKey {
//        case country = "Country"
//        case countryCode = "CountryCode"
//        case slug = "Slug"
//        case newConfirmed = "NewConfirmed"
//        case totalConfirmed = "TotalConfirmed"
//        case newDeaths = "NewDeaths"
//        case totalDeaths = "TotalDeaths"
//        case newRecovered = "NewRecovered"
//        case totalRecovered = "TotalRecovered"
//        case date = "Date"
//    }
//}
//
//// MARK: - Global
//struct Global: Codable {
//    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int
//    let newRecovered, totalRecovered: Int
//
//    enum CodingKeys: String, CodingKey {
//        case newConfirmed = "NewConfirmed"
//        case totalConfirmed = "TotalConfirmed"
//        case newDeaths = "NewDeaths"
//        case totalDeaths = "TotalDeaths"
//        case newRecovered = "NewRecovered"
//        case totalRecovered = "TotalRecovered"
//    }
//}
