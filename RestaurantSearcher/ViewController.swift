//
//  ViewController.swift
//  RestaurantSearcher
//
//  Created by Cara on 5/17/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import UIKit

/**
 * This ViewController has a Search bar that filters a TableView by user's typed search
 * The data is all the favorite restaurants local to the Twin Cities
 */

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    // All the favorite restaurants
    let data = [
        "Fogo de Chao": "Brazilian",
        "Chipotle": "Mexican",
        "Jimmy John's": "Sandwiches",
        "Broadway Pizza": "Pizza",
        "Smashburger": "Burgers",
        "Leeann Chin": "Chinese",
        "Hoban": "Korean",
        "Red's Savoy Pizza": "Pizza",
        "Holy Land": "Middle Eastern",
        "Manny's Steakhouse": "Steakhouse",
        "Latuff's Pizzeria": "Pizza",
        "Lindey's Steakhouse": "Steakhouse",
        "Dong Yang": "Korean",
        "White Castle": "Burgers",
        "Famous Dave's": "Barbeque",
        "Vincent's": "French",
    ]
    
    // need this to be global
    var restaurantArray = [(String, String)]()
    
    
    var filteredData = [(String, String)]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done
        
        // transforms the dictionary above into a sorted array sorted alphabetically
        restaurantArray = data.map { $0 }.sorted {$0.key < $1.key}
    }
    
    // Just 1 section needed
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of rows needed
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            
            return filteredData.count
        }
        
        return restaurantArray.count
    }
    
    
    // This function maps each row's restaurant name and cuisine to the title and subtitle
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableCell", for: indexPath) as! UITableCell
            
            if isSearching {
                
                let row = filteredData[indexPath.row]
                cell.textLabel?.text = row.0
                cell.detailTextLabel?.text = row.1
                
            } else {
                let row = restaurantArray[indexPath.row]
                cell.textLabel?.text = row.0
                cell.detailTextLabel?.text = row.1
                
            }
            
            return cell
        
    }
    
    // This function filters the Tableview to show results based on what the user has typed
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filteredData = restaurantArray.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased() || $1.lowercased().prefix(searchText.count) == searchText.lowercased()})
        isSearching = true
        tableView.reloadData()
    }
    
    // This function responds to the user selecting the cancel button
            
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}
    

    




