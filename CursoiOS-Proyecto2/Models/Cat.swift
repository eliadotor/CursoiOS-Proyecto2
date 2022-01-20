//
//  Cat.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 20/1/22.
//

import Foundation
import UIKit


struct Cat: Decodable {
    let id: String
    let created_at: String
    let tags: [String]
}

extension Cat {
    var tagText: String {
        return tags.joined(separator: ", ")
    }
    
    var imageUrl: URL? {
        return URL(string: "https://cataas.com/cat/\(id)")
    }
    
    var toListCellViewModel: ListTableCellViewModel {
        return ListTableCellViewModel(imageUrl: imageUrl, text: tagText)
    }
}
