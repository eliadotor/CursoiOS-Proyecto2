//
//  CatsListPresenter.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 24/1/22.
//

import Foundation


class CatsListPresenter: ListPresenterContract {

    var fetchCats : FetchCatsUseCase?

    var view: ListViewController?
    
    private var cats = [Cat]() {
        didSet {
            view?.reloadData()
        }
    }

    private var favorites = [String]()

    var numItems: Int {
        return cats.count
    }
    
    func viewDidLoad() {
        fetchData()
    }
    
    func cellViewModel(at indexPath: IndexPath) -> ListTableCellViewModel {
        let item = cats[indexPath.row]
        return item.toListCellViewModel
    }
    
    func isFavorite(at indexPath: IndexPath) -> Bool {
        let item = cats[indexPath.row]
        return favorites.contains(item.id)
    }
    
    func didSelectFavorite(at indexPath: IndexPath) {
        let item = cats[indexPath.row]
        if !favorites.contains(item.id) {
            favorites.append(item.id)
            view?.setFavorite(true, at: indexPath)
            
        } else if let index = favorites.firstIndex(of: item.id) {
            favorites.remove(at: index)
            view?.setFavorite(false, at: indexPath)
        }
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let item = cats[indexPath.row]
        let viewController = DetailControllerBuilder().build(viewModel: item.toDetailViewModel)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }

    
    private func fetchData(){
        fetchCats?.fetchCats(completion: { cats in
            self.cats = cats
        })
    }
    

}
