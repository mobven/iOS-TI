//
//  String.swift
//  MobvenIOSTI
//
//  Created by Rasid Ramazanov on 21.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

extension String {
    
    func formatDate(with format: String?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else { return nil }
        
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
}
