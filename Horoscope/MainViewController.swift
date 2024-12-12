//
//  ViewController.swift
//  Horoscope
//
//  Created by Tardes on 12/12/2024.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let horoscopeList: [Horoscope] = Horoscope.getAll()
    // Defines a constant `horoscopeList` which holds an array of Horoscope objects
    // The Horoscope.getAll() method returns a list of horoscope data (names, dates, icons)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // This is a required method from the UITableViewDataSource protocol. It tells the table view how many rows (items) should be displayed in a specific section.
        return horoscopeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // This is another required method from the UITableViewDataSource protocol. It tells the table view what to display in each row by providing a cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HoroscopeViewCell
        // 'dequeueReusableCell(withIdentifier:)' checks if there is a reusable table view cell that has already been used for a previous row and can be reused (instead of creating a new cell every time). Cells in UITableView are reused when they go off-screen (as the user scrolls).
        
        // 'indexPath' specifies the location of the cell in the table view (i.e., which row and section the cell is in).
        
        // 'as! HoroscopeViewCell' is a forced type cast, telling Swift to treat the dequeued cell as a HoroscopeViewCell (your custom cell class). The '!' means you’re forcefully unwrapping it and assuming the cast will succeed.
        let horoscope = horoscopeList[indexPath.row]
        cell.render(from: horoscope)
        return cell
    }

}
