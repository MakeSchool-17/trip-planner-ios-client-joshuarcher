//
//  TripListTableViewCell.swift
//  TripPlanner-Google
//
//  Created by Joshua Archer on 10/28/15.
//  Copyright © 2015 Joshua Archer. All rights reserved.
//

import UIKit

class TripListTableViewCell: UITableViewCell {
    
    var trip: Trip? {
        didSet {
            self.textLabel?.text = trip?.locationName
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
