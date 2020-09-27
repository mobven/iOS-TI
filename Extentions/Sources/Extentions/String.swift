//
//  File.swift
//  
//
//  Created by Huseyin inan on 27.09.2020.
//

import Foundation

public extension String {

	func formatDate(with format: String?) -> String? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'kk:mm:ssZ"
		guard let date = dateFormatter.date(from: self) else { return nil }

		dateFormatter.dateFormat = format
		return dateFormatter.string(from: date)
	}

}
