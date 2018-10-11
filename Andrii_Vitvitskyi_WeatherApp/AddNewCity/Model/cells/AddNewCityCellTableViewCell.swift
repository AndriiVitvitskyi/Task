//
//  AddNewCityCellTableViewCell.swift
//  Andrii_Vitvitskyi_WeatherApp
//
//  Created by Mac on 11.03.18.
//  Copyright © 2018 Vitvitskyi. All rights reserved.
//

import UIKit

class AddNewCityCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var currentLocationImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
