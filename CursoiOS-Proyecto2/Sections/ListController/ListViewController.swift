//
//  ListViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 19/1/22.
//

import UIKit
import Kingfisher

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var fetchCats : FetchCatsUseCase?
    // Dependencia
    //var fetchLandmarks: FetchLandmarksUseCase?
    var detailBuilder: DetailControllerBuilder?
    
    static func createFromStoryBoard() -> ListViewController {
        return UIStoryboard(name: "ListViewController", bundle: .main).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchData()
        
    }
    
    private var cats = [Cat]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private var favorites = [String]()
    
    private func fetchData(){
        fetchCats?.fetchCats(completion: { cats in
            self.cats = cats
        })
    }
    

}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cat = cats[indexPath.row]
        guard let detailController = detailBuilder?.build(viewModel: cat.toDetailViewModel) else {
            return
        }
        
        //let viewController = DetailControllerBuilder().build(viewModel: landmark.toDetailViewModel)
        navigationController?.pushViewController(detailController, animated: true)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell
        let cat = cats[indexPath.row]
        
        cell.delegate = self
        cell.isFavorite = favorites.contains(cat.id)
        cell.configure(viewModel: cat.toListCellViewModel)
        /*if let url = cat.imageUrl, let data = try? Data(contentsOf: url) {
            cell.imageView?.image = UIImage(data: data)
        }*/
        
        return cell
    }
}


extension ListViewController: ListTableViewDelegate {
    func didPressInFavorite(cell: ListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        cell.isFavorite = !cell.isFavorite
        //cell.isFavorite.toggle()
        let cat = cats[indexPath.row]
        if cell.isFavorite {
            favorites.append(cat.id)
        } else if let index = favorites.firstIndex(of: cat.id){
            favorites.remove(at: index)
        }
    }
}
/*
 Es lo mismo que meter la función static directamente en la clase
extension ListViewController {
    static func createFromStoryBoard() -> ListViewController {
        return UIStoryboard(name: "ListViewController", bundle: .main).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
    }
}*/
