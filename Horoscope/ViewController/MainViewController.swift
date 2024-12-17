//
//  ViewController.swift
//  Horoscope
//
//  Created by Tardes on 12/12/2024.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var horoscopeList: [Horoscope] = Horoscope.getAll()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Horoscope"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        tableView.dataSource = self
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // This is a required method from the UITableViewDataSource protocol. It tells the table view how many rows (items) should be displayed in a specific section.
        return horoscopeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // This is another required method from the UITableViewDataSource protocol. It tells the table view what to display in each row by providing a cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HoroscopeViewCell
        // 'dequeueReusableCell(withIdentifier:)' checks if there is a reusable table view cell that has already been used for a previous row and can be reused (instead of creating a new cell every time). Cells in UITableView are reused when they go off-screen (as the user scrolls).

        let horoscope = horoscopeList[indexPath.row]
        cell.render(from: horoscope)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.isEmpty) {
            horoscopeList = Horoscope.getAll()
        } else {
            horoscopeList = Horoscope.getAll().filter({ horoscope in
                horoscope.name.range(of: searchText, options: .caseInsensitive) != nil
            })
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        horoscopeList = Horoscope.getAll()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if (segue.identifier == "navigateToDetail") {
           let detailViewController = segue.destination as! DetailViewController
           let indexPath = tableView.indexPathForSelectedRow!
           let horoscope = horoscopeList[indexPath.row]
           detailViewController.horoscope = horoscope
           tableView.deselectRow(at: indexPath, animated: true)
           }
       }
}
/*
 
iOS (Swift)                 Android (Kotlin)
UITableView                 RecyclerView
UITableViewDataSource       RecyclerView.Adapter
dequeueReusableCell()       ViewHolder (recycling)
cellForRowAt                onCreateViewHolder()
numberOfRowsInSection       getItemCount()
render(from:)               onBindViewHolder()
 
*/
