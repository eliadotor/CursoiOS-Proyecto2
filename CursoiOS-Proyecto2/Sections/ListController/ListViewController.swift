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
    
    
    private func fetchData(){
        fetchCats?.fetchCats(completion: { cats in
            self.cats = cats
        })
    }
    

}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let cat = landmarks[indexPath.row]
        guard let detailController = detailBuilder?.build(viewModel: cat.toDetailViewModel) else {
            return
        }
        
        //let viewController = DetailControllerBuilder().build(viewModel: landmark.toDetailViewModel)
        navigationController?.pushViewController(detailController, animated: true)*/
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell
        let cat = cats[indexPath.row]
        
        cell.configure(viewModel: cat.toListCellViewModel)
        /*if let url = cat.imageUrl, let data = try? Data(contentsOf: url) {
            cell.imageView?.image = UIImage(data: data)
        }*/
        
        return cell
    }
}
/*
 Es lo mismo que meter la función static directamente en la clase
extension ListViewController {
    static func createFromStoryBoard() -> ListViewController {
        return UIStoryboard(name: "ListViewController", bundle: .main).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
    }
}*/
