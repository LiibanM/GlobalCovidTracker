//
//  ShowAllCountriesTableViewCell.swift
//  CovidGlobalTracker
//
//  Created by Liiban Mukhtar on 24/08/2020.
//  Copyright © 2020 Liiban Mukhtar. All rights reserved.
//

import UIKit

class ShowAllCountriesTableViewCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var newConfirmed: UILabel!
    @IBOutlet weak var totalConfirmed: UILabel!
    @IBOutlet weak var totalDeaths: UILabel!
    
    func setCountry(country: CountriesDetail){
        countryName.text = country.Country + " " + flag(from: country.CountryCode)
        newConfirmed.text = "New confirmed cases: " + String(country.NewConfirmed)
        totalConfirmed.text = "Total confirmed cases: " + String(country.TotalConfirmed)
        totalDeaths.text = "Total Deaths : " + String(country.TotalDeaths)
    }
    
    func flag(from country:String) -> String {
        
        let base : UInt32 = 127397
        var s = ""
        for v in country.uppercased().unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return s
    }
}
