//
//  CatsListInteractor.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 24/1/22.
//

import Foundation
import Alamofire

class CatsListInteractor: ListInteractorContrac {
    
    private static var favoritesKey = "favorite.cats.array"
    
    var output: ListInteractorOutputContrac?
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    private var favorites: [String] {
        get {
            userDefaults.stringArray(forKey: CatsListInteractor.favoritesKey) ?? []
        }
        
        set {
            userDefaults.setValue(newValue, forKey: CatsListInteractor.favoritesKey)
        }
    }
    
    func fetchItems() {
        guard let url = URL(string: "https://cataas.com/api/cats") else {
            output?.fetchDidFail()
            return
        }
        
        let request = URLRequest(url: url)
        
        AF.request(request).responseDecodable { (response: DataResponse<[Cat], AFError>) in
            switch response.result {
            case.success(let cats): self.output?.didFetch(cats: cats)
            case.failure: self.output?.fetchDidFail()
            }
        }.validate() // Para validar
    }
    
    func didPressFavorite(in cat: Cat) {
        if !favorites.contains(cat.id) {
            favorites.append(cat.id)
            output?.didUpdateFavorites(in: cat, favorite: true)
            
        } else if let index = favorites.firstIndex(of: cat.id) {
            favorites.remove(at: index)
            output?.didUpdateFavorites(in: cat, favorite: false)
        }
    }
    
    func isFavorite(cat: Cat) -> Bool {
        return favorites.contains(cat.id)
    }
}
