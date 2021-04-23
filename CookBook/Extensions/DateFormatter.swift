//
//  DateFormatter.swift
//  CookBook
//
//  Created by SalemMacPro on 23.4.21.
//

import Foundation

extension DateFormatter {
  static let ddMMyyyy: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.yyyy"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}
