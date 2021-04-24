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
    @IBOutlet weak var dynamicCellHeight: NSLayoutConstraint!
    
    var count = 0
    
    func set(gist: Gists.Fetch.ViewModel.Gist) {
        if let id =  gist.id {
            idLabel.text = id
            count += 1
        }
        
        if let desc =  gist.description {
            idLabel.text = desc
            count += 1
        }
        
        if let date =  gist.date {
            idLabel.text = date
            count += 1
        }
        
        if let comment =  gist.comments {
            idLabel.text = comment
            count += 1
        }
        
        idLabel.text = gist.id
        descriptionLabel.text = gist.description
        dateLabel.text = gist.date
        commentsLabel.text = gist.comments
        favoriteButton.isHidden = !gist.isFavorite
        dynamicCellHeight.constant = count < 4 ? 120 : 150
    }
    
}
