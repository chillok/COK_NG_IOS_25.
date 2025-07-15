//
//  String+Date.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import Foundation

extension String {
    func extractYear() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        guard let date = formatter.date(from: self) else {
            return nil
        }

        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        return String(year)
    }
}
