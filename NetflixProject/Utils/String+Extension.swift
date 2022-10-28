//
//  String+Extension.swift
//  NetflixProject
//
//  Created by Ivan Valero on 21/09/2022.
//

import Foundation


extension String {
    var capitalizedSentence: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
}
