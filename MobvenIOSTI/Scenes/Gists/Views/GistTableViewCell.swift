//
//  GistTableViewCell.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit

class GistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    func set(gist: Gists.Fetch.ViewModel.Gist) {
        idLabel.text = gist.id
        descriptionLabel.text = gist.description
        dateLabel.text = gist.date
        commentsLabel.text = "\(gist.comments)"
        favoriteButton.isHidden = !gist.isFavorite
    }
    
}
