//
//  BundleExtensions.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 27/1/22.
//

import Foundation

extension Bundle {
    var baseAPIUrl: URL {
        guard let urlString = infoDictionary?["API_BASE_URL"] as? String else {
            fatalError("Invalid Base url")
        }
        return URL(string: urlString)!
    }
}
