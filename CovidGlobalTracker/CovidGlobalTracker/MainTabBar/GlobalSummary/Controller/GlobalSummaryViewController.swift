//
//  GlobalSummaryViewController.swift
//  CovidGlobalTracker
//
//  Created by Liiban Mukhtar on 22/08/2020.
//  Copyright © 2020 Liiban Mukhtar. All rights reserved.
//

import UIKit

class GlobalSummaryViewController: UIViewController {
    
    
    @IBOutlet weak var contentView: UIView!{
        didSet{
            contentView.layer.cornerRadius = 8;
            contentView.layer.masksToBounds = true;
        }
    }
    
    
    var globalSummary = [GlobalData]()
    
    let allAPI = ApiRequest()
    
    var loading = true
    var datatest: String = ""
    @IBOutlet weak var newConfirmedLabel: UILabel!
    @IBOutlet weak var totalConfirmedLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    @IBOutlet weak var newRecoveredLabel: UILabel!
    @IBOutlet weak var totalRecoveredLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         getGlobalSummary()
        //setDataLabels()
    }
    
  
    
    func getGlobalSummary(){
        
        guard let url = URL(string: "https://api.covid19api.com/summary") else {
            fatalError("Url failed")
        }
        URLSession.shared.dataTask(with: url){ [weak self] (data, response, error) in
            //handle decoding here
            if let data = data {
                guard let globalData = try? JSONDecoder().decode(AllData.self, from: data) else {
                    fatalError("couldn't decode the data \(error)")
                }
                //print(countryData)
                self?.globalSummary.append(globalData.Global)
                //print(self?.globalSummary)
                
                
            }
         self?.loading = false
            
            DispatchQueue.main.async {
                self?.setDataLabels(data: self!.globalSummary)
            }
            
        }.resume()
    }
    
    func setDataLabels(data: [GlobalData]){
        newConfirmedLabel.text = "New confirmed cases : " + String(globalSummary[0].NewConfirmed)
        totalConfirmedLabel.text = "Total confirmed cases : " + String(globalSummary[0].TotalConfirmed)
        newDeathsLabel.text = "New Deaths: " + String(globalSummary[0].NewDeaths)
        totalDeathsLabel.text = "Total Death Toll: " + String(globalSummary[0].TotalDeaths)
        newRecoveredLabel.text = "New Recovered: " + String(globalSummary[0].NewRecovered)
        totalRecoveredLabel.text = "Total Recovered: " + String(globalSummary[0].TotalRecovered)
    }
}

