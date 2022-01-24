//
//  ListViewContract.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 24/1/22.
//

import Foundation
import UIKit


protocol ListViewContract: UIViewController {
    var presenter: ListPresenterContract? {set get}
    
    func reloadData()
    func setFavorite(_ favorite: Bool, at indexPath: IndexPath)
}

protocol ListPresenterContract: AnyObject {
    var view: ListViewController? {set get}
    var interactor: ListInteractorContrac? {set get}
    
    var numItems: Int {get}
    
    func viewDidLoad()
    
    func cellViewModel(at indexPath: IndexPath) -> ListTableCellViewModel
    func isFavorite(at indexPath: IndexPath) -> Bool
    func didSelectFavorite(at indexPath: IndexPath)
    func didSelectItem(at indexPath: IndexPath)
}

protocol ListInteractorContrac {
    var output: ListInteractorOutputContrac? {get set}
    func fetchItems()
    func didPressFavorite(in cat: Cat)
    func isFavorite(cat: Cat) -> Bool
}

protocol ListInteractorOutputContrac {
    func didFetch(cats: [Cat])
    func fetchDidFail()
    func didUpdateFavorites(in cat: Cat, favorite: Bool)
}

protocol CatListWireframeContract {
    var view: UIViewController? {get set}
    func navigate(to cat: Cat)
}
