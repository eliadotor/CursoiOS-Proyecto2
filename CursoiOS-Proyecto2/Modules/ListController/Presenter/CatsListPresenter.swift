//
//  CatsListPresenter.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 24/1/22.
//

import Foundation


class CatsListPresenter: ListPresenterContract {    

    weak var view: ListViewController?
    var interactor: ListInteractorContrac?
    var wireframe: CatsListWireframeContract?
    
    private var cats = [Cat]() {
        didSet {
            view?.reloadData()
        }
    }

    var numItems: Int {
        return cats.count
    }
    
    func viewDidLoad() {
        interactor?.output = self
        fetchData()
    }
    
    func cellViewModel(at indexPath: IndexPath) -> ListTableCellViewModel {
        let item = cats[indexPath.row]
        return item.toListCellViewModel
    }
    
    func isFavorite(at indexPath: IndexPath) -> Bool {
        let item = cats[indexPath.row]
        return interactor?.isFavorite(cat: item) ?? false
    }
    
    func didSelectFavorite(at indexPath: IndexPath) {
        let item = cats[indexPath.row]
        interactor?.didPressFavorite(in: item)
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let cat = cats[indexPath.row]
        wireframe?.navigate(to: cat)
    }
    
    private func fetchData(){
        interactor?.fetchItems()
    }
    deinit {
        print("deinit \(self)")
    }
}


extension CatsListPresenter: ListInteractorOutputContrac {
    func didFetch(cats: [Cat]) {
        self.cats = cats
    }
    
    func fetchDidFail() {
        print("Error")
    }
    
    func didUpdateFavorites(in cat: Cat, favorite: Bool) {
        guard let index = cats.firstIndex(of: cat) else {return}
        view?.setFavorite(favorite, at: IndexPath.init(row: index, section: 0))
    }
    
}
