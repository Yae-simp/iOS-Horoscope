//
//  DetailViewController.swift
//  Horoscope
//
//  Created by Tardes on 13/12/2024.
//
import UIKit

class DetailViewController: UIViewController {
    
    var horoscope: Horoscope!
    var isFavorite: Bool = false
    var session: SessionManager!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var dailyTextView: UITextView!
    @IBOutlet weak var favoriteMenu: UIBarButtonItem!
    
    var dailyResult: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        session = SessionManager()
        
        navigationItem.title = horoscope.name
        datesLabel.text = horoscope.dates
        iconImageView.image = horoscope.icon
        getDaily(id: horoscope.id)
        
        isFavorite = session.isFavorite(horoscopeId: horoscope.id)
        setFavoriteIcon()
    }
    
    func setFavoriteIcon() {
        if (isFavorite) {
            favoriteMenu.image = UIImage(systemName: "heart.fill")
        } else {
            favoriteMenu.image = UIImage(systemName: "heart")
        }
    }

    @IBAction func setFavorite(_ sender: Any) {
        if (isFavorite) {
            session.setFavorite(horoscopeId: "")
        } else {
            session.setFavorite(horoscopeId: horoscope.id)
        }
        isFavorite = !isFavorite
        setFavoriteIcon()
    }
    
    func getDaily(id: String) {
        let urlString = "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=\(id)&day=TODAY"
    
        guard let url = URL(string: urlString) else {
            self.dailyResult = "Invalid URL"
            self.updateUI()
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.dailyResult = "Request Error: \(error.localizedDescription)"
                self.updateUI()
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    guard let data = data else {
                        self.dailyResult = "No data received"
                        self.updateUI()
                        return
                    }
                    if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let data = jsonResponse["data"] as? [String: Any],
                       let horoscopeData = data["horoscope_data"] as? String {
                        self.dailyResult = horoscopeData
                    } else {
                        self.dailyResult = "Failed to parse the horoscope data."
                    }
                } else {
                    self.dailyResult = "HTTP Error: \(httpResponse.statusCode)"
                }
            } else {
                self.dailyResult = "Invalid response"
            }
            self.updateUI()
        }
        task.resume()
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.dailyTextView.text = self.dailyResult
        }
    }
}


