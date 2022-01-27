//
//  PermissionsViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 27/1/22.
//

import UIKit

protocol PermissionPresenterContract {
    var view: PermissionsViewContract? {get set}
    func didPressPermissionsButton()
}
class PermissionsViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.view = self
        // Do any additional setup after loading the view.
    }
    var presenter: PermissionPresenterContract?
    
    @IBAction func buttonPressed(_ sender: Any) {
        presenter?.didPressPermissionsButton()
    }
}


extension PermissionsViewController: PermissionsViewContract {
    func setAllowed() {
        DispatchQueue.main.async {
            self.button.isEnabled = false
            self.label.text = "Permitido"
            
        }
    }
    
    func setNotAllowed() {
        DispatchQueue.main.async {
            self.button.isEnabled = true
            self.label.text = "No Permitido"
            
        }
    
    }
    
    func openSetting() {
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }
    }
    
    
}
