//
//  CatsListInteractor.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 24/1/22.
//

import Foundation
import Alamofire

class CatsListInteractor: ListInteractorContrac {
    var output: ListInteractorOutputContrac?
    
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
}
