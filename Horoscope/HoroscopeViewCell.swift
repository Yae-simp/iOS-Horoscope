//
//  HoroscopeViewCell.swift
//  Horoscope
//
//  Created by Tardes on 12/12/2024.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {
    // Defines the HoroscopeViewCell class, which is a custom UITableViewCell.
    // This cell will be used to display a single horoscope's information in a table view row.
    
    @IBOutlet weak var nameLabel: UILabel!
    // This IBOutlet connects a UILabel from the storyboard to the `nameLabel` property.
    // It will be used to display the name of the horoscope (e.g., "Aries", "Taurus", etc.).

    @IBOutlet weak var datesLabel: UILabel!
    // This IBOutlet connects a UILabel from the storyboard to the `datesLabel` property.
    // It will be used to display the date range of the horoscope (e.g., "March 21 to April 19").

    @IBOutlet weak var iconImageView: UIImageView!
    // This IBOutlet connects an UIImageView from the storyboard to the `iconImageView` property.
    // It will display the icon image of the horoscope (e.g., an image of the Aries symbol).

    override func awakeFromNib() {
        super.awakeFromNib()
        // This method is called when the cell is loaded from the storyboard or nib file.
        // It's used for any additional setup after the cell's views have been loaded.
        // For now, there's no additional setup, but it can be used to initialize properties or UI elements.
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // This method is called when the cell's selection state changes (i.e., when it is tapped).
        // The `selected` parameter is true when the cell is selected, and false when it is deselected.
        // The `animated` parameter is true if the selection change is animated, and false otherwise.
        
        // The method can be used to customize the appearance of the cell when selected (e.g., change background color).
        // Here, no customizations are done, but this method could be overridden to handle selection animations or state changes.
    }

    func render(from horoscope: Horoscope) {
        // This is a custom method that takes a `Horoscope` object and sets up the cell's UI components to display the horoscope's data.
        
        nameLabel.text = horoscope.name
        // Sets the `nameLabel`'s text to the name of the horoscope (e.g., "Aries", "Taurus").
        
        datesLabel.text = horoscope.dates
        // Sets the `datesLabel`'s text to the date range for the horoscope (e.g., "March 21 to April 19").
        
        iconImageView.image = horoscope.icon
        // Sets the `iconImageView`'s image to the horoscope's icon (an image like the Aries symbol or the Taurus symbol).
    }
}

