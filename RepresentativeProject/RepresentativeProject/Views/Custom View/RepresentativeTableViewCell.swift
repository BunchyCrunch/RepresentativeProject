//
//  RepresentativeTableViewCell.swift
//  RepresentativeProject
//
//  Created by Josh Sparks on 10/3/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        nameLabel.text = representative?.name
        partyLabel.text = representative?.party
        districtLabel.text = representative?.district
        websiteLabel.text = representative?.link
        phoneNumberLabel.text = representative?.phone
    }
}
