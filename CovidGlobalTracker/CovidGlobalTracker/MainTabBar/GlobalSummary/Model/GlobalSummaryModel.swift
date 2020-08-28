//
//  GlobalSummaryModel.swift
//  CovidGlobalTracker
//
//  Created by Liiban Mukhtar on 27/08/2020.
//  Copyright © 2020 Liiban Mukhtar. All rights reserved.
//

import Foundation

struct AllData: Codable {
   var Global: GlobalData
}

// MARK: - Global

struct GlobalData: Codable {
    
   var NewConfirmed: Int
   var TotalConfirmed: Int
   var  NewDeaths: Int
   var  TotalDeaths: Int
   var NewRecovered: Int
   var  TotalRecovered: Int
    
//    init(NewConfirmed: Int,
//         TotalConfirmed: Int,
//         NewDeaths: Int,
//         TotalDeaths: Int,
//         NewRecovered: Int,
//         TotalRecovered: Int) {
//        
//        self.NewConfirmed = NewConfirmed
//        self.TotalConfirmed = TotalConfirmed
//        self.NewDeaths = NewDeaths
//        self.TotalDeaths = TotalDeaths
//        self.NewRecovered = NewRecovered
//        self.TotalRecovered = TotalRecovered
//    }
    
}
    
//
//struct myStructWithInit {
//    let myString: String?
//    let myInt: Int?
//    let myDouble: Double?
//
//    init(myString: String? = nil, //👈
//         myInt: Int? = nil,
//         myDouble: Double? = nil) {
//
//        self.myString = myString
//        self.myInt = myInt
//        self.myDouble = myDouble
//    }

