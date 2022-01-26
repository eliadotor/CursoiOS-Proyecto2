//
//  FavoritesProvider.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 26/1/22.
//

import Foundation

enum FavoritesProviderError: Error {
    case badUrl, generic(Error?)
}
protocol FavoritesProvider {
    func didUpdateFavorite(id: String, _ completion: @escaping (Result<Bool, Error>) -> ())
    func isFavorite(id: String) -> Bool
}

class UserDefaultsFavoriteProvider: FavoritesProvider {
    private static var favoritesKey = "favorite.cats.array"

    private let userDefaults: UserDefaults
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    private var favorites: [String] {
        get {
            userDefaults.stringArray(forKey: UserDefaultsFavoriteProvider.favoritesKey) ?? []
        }
        
        set {
            userDefaults.setValue(newValue, forKey: UserDefaultsFavoriteProvider.favoritesKey)
        }
    }
    
    func didUpdateFavorite(id: String, _ completion: @escaping (Result<Bool, Error>) -> ()) {
        if !favorites.contains(id) {
            favorites.append(id)
            completion(.success(true))
            
        } else if let index = favorites.firstIndex(of: id) {
            favorites.remove(at: index)
            completion(.success(false))
        }
    }
    
    func isFavorite(id: String) -> Bool {
        return favorites.contains(id)
    }
}
