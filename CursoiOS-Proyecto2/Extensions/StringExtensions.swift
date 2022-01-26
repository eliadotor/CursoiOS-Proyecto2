//
//  StringExtensions.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 26/1/22.
//

import Foundation


extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
