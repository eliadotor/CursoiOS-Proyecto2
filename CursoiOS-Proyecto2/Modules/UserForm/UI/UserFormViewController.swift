//
//  UseFormViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 25/1/22.
//

import UIKit

class UserFormViewController: UIViewController, UserFormViewContract {
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var mailInput: UITextField!
    
    var presenter: UserFormPresenterContract?
    
    static func createFromStoryBoard() -> UserFormViewController {
        return UIStoryboard(name: "UserFormViewController", bundle: .main).instantiateViewController(withIdentifier: "UserFormViewController") as! UserFormViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [mailInput,phoneInput, lastNameInput, nameInput].forEach { input in
            input?.delegate = self
        }
    }
    
}


extension UserFormViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case nameInput: presenter?.didUpdateName(textField.text)
        case lastNameInput: presenter?.didUpdateLastName(textField.text)
        case phoneInput: presenter?.didUpdatePhone(textField.text)
        case mailInput: presenter?.didUpdateMail(textField.text)
        default: break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameInput: lastNameInput.becomeFirstResponder()
        case lastNameInput: phoneInput.becomeFirstResponder()
        case phoneInput: mailInput.becomeFirstResponder()
        case mailInput: textField.resignFirstResponder()
        default: break
        }
        
        return true
    }
}
