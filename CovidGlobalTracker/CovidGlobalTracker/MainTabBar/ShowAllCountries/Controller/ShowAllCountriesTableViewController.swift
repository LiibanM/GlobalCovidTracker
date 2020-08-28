//
//  ShowAllCountriesTableViewController.swift
//  CovidGlobalTracker
//
//  Created by Liiban Mukhtar on 22/08/2020.
//  Copyright © 2020 Liiban Mukhtar. All rights reserved.
//

import UIKit

enum CovidAPIErrors:Error {
    case noDataAvailable
    case canNotProcessData
}

class ShowAllCountriesTableViewController: UITableViewController, UISearchBarDelegate{

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var listOfCountries = [CountriesDetail]()
    var filteredData = [CountriesDetail]()

    let allAPI = ApiRequest()
    
    var loading = true
    
    var numberOfCountries = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        //saveAPIresult()
        //number()
        getAllCountries()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //Networking
    func getAllCountries(){
           
           guard let url = URL(string: "https://api.covid19api.com/summary") else {
               fatalError("Url failed")
           }
           URLSession.shared.dataTask(with: url){ [weak self] (data, response, error) in
               //handle decoding here
               if let data = data {
                   guard let countryData = try? JSONDecoder().decode(AllCountry.self, from: data) else {
                       fatalError("couldn't decode the data \(error)")
                   }
                   //print(countryData)
                self?.listOfCountries.append(contentsOf: countryData.Countries)
                self?.filteredData.append(contentsOf: countryData.Countries)

                print(self?.listOfCountries)
               }
            self?.loading = false
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
           }.resume()
       }

//    func saveAPIresult(){
//         allAPI.getAllCountries{[weak self] result in
//                   switch result {
//                   case .failure(let error):
//                       print(error)
//                   case .success(let countryDetails):
//                    self?.numberOfCountries = countryDetails.count
//                       self?.listOfCountries = countryDetails
//                   }
//            for items in self!.listOfCountries{
//                print(items)
//            }
//        }
//    }
//
//    func number(){
//        print("im here")
//        print(self.numberOfCountries)
//    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 40
//    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ShowAllCountriesTableViewCell
        if loading {
            //cell.textLabel?.text = "Loading...."
        }else{
            let poke = filteredData[indexPath.row]
            cell.setCountry(country: poke)
            
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if loading {
            return 1
        }else{
         return filteredData.count
        }
    }

    //search bar config
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        filteredData = []
        
        if(searchText == ""){
            filteredData = listOfCountries
        }
        else{
            for regions in listOfCountries{
                if regions.Country.lowercased().contains(searchText.lowercased()){
                    filteredData.append(regions)
                }
            }
        }
        self.tableView.reloadData()
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

 
