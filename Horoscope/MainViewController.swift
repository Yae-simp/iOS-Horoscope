//
//  ViewController.swift
//  Horoscope
//
//  Created by Tardes on 12/12/2024.
//

import UIKit

// Defines a view controller (MainViewController) that displays a list of horoscopes in a table view.
class MainViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let horoscopeList: [Horoscope] = Horoscope.getAll()
    // Defines a constant `horoscopeList` which holds an array of Horoscope objects
    // Horoscope.getAll() method returns a list of horoscope data (names, dates, icons)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Horoscope"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        tableView.dataSource = self
        print("Horoscope List: \(horoscopeList)")
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
