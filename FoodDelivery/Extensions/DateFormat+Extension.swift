//
//  DateFormat+Extension.swift
//  FoodDelivery
//
//  Created by Fahad Bin Raza on 25/05/2023.
//

import Foundation

extension Date {
  public func dateString(_ format: String = "EEEE, MMM d, h:mm a") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    // self the Date object itself
    // dateValue().dateString()
    return dateFormatter.string(from: self)
  }
}
