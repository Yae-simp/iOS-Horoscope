//
//  DetailViewController.swift
//  Horoscope
//
//  Created by Tardes on 13/12/2024.
//

import UIKit

class DetailViewController: UIViewController {

    var horoscope: Horoscope!

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var dailyLabel: UILabel!
    
    var horoscopeId: String = "aries"
    var dailyResult: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = horoscope.name
        
        datesLabel.text = horoscope.dates
        iconImageView.image = horoscope.icon
    }

    func getDaily(method: String) {
    }
    
}
