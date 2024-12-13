//
//  HoroscopeViewCell.swift
//  Horoscope
//
//  Created by Tardes on 12/12/2024.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {
    // This cell will be used to display a single horoscope's information in a table view row.
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    // @IBOutlet is a special keyword used to connect UI elements from the storyboard (visual layout) to your code.

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // setSelected is called when the cell's selection state changes (i.e., when it is tapped).
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // render is used to display data on the screen within HoroscopeViewCell.
    func render(from horoscope: Horoscope) {
        nameLabel.text = horoscope.name
        datesLabel.text = horoscope.dates
        iconImageView.image = horoscope.icon
    }
}

