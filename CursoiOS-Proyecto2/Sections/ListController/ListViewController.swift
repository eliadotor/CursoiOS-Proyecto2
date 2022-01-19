//
//  ListViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 19/1/22.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Dependencia
    var fetchLandmarks: FetchLandmarksUseCase?
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
    
    private var landmarks = [Landmark]() {
        // Para que recargue los datos cada vez que haya un cambio
        didSet {
            tableView.reloadData()
        }
    }
    
    private func fetchData(){
        fetchLandmarks?.fetchLandmarks({result  in
            switch result {
            case.success(let landmarks):
                self.landmarks = landmarks
                // Si los datos tardan en llegar self.tableView.reloadData()
            case.failure: break
            }
        })
    }
    

}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let landmark = landmarks[indexPath.row]
        guard let detailController = detailBuilder?.build(viewModel: landmark.toDetailViewModel) else {
            return
        }
        
        //let viewController = DetailControllerBuilder().build(viewModel: landmark.toDetailViewModel)
        navigationController?.pushViewController(detailController, animated: true)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        let landmark = landmarks[indexPath.row]
        cell.textLabel?.text = landmark.name
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
