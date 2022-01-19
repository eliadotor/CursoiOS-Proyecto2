//
//  DetailViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 19/1/22.
//

import UIKit

class DetailViewController: UIViewController {

    
    static func create() -> DetailViewController {
        return DetailViewController(nibName: "DetailViewController", bundle: .main) 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    

}
