//
//  UseFormViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 25/1/22.
//

import UIKit

struct UserFormViewModel {
    let name:String?
    let lastName: String?
    let phone:String?
    let mail: String?
    let bio: String?
}

class UserFormViewController: UIViewController, UserFormViewContract {
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var mailInput: UITextField!
    
    @IBOutlet weak var userBioTextArea: UITextView!
    
    var presenter: UserFormPresenterContract?
    
    @IBAction func scrollViewTapped(_ sender: Any) {
        view.endEditing(true)
    }
    @IBOutlet weak var scrollView: UIScrollView!

    


    @IBAction func sendPressed(_ sender: Any) {
        presenter?.didPressSend()
    }
    
    static func createFromStoryBoard() -> UserFormViewController {
        return UIStoryboard(name: "UserFormViewController", bundle: .main).instantiateViewController(withIdentifier: "UserFormViewController") as! UserFormViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotifications()
        [mailInput,phoneInput, lastNameInput, nameInput].forEach { input in
            input?.delegate = self
        }
        userBioTextArea.delegate = self
        presenter?.didLoad()
        
    }
    
    func configure(with viewModel: UserFormViewModel) {
        DispatchQueue.main.async {
            self.nameInput.text = viewModel.name
            self.lastNameInput.text = viewModel.lastName
            self.phoneInput.text = viewModel.phone
            self.mailInput.text = viewModel.mail
            self.userBioTextArea.text = viewModel.bio
        }
    }
    
    func didValidateName(_ valid: Bool) {
        didUpdateValidation(input: nameInput, valid: valid)
    }
    
    func didValidateLastName(_ valid: Bool) {
        didUpdateValidation(input: lastNameInput, valid: valid)
    }
    
    func didValidatePhone(_ valid: Bool) {
        didUpdateValidation(input: phoneInput, valid: valid)
    }
    
    func didValidateMail(_ valid: Bool) {
        didUpdateValidation(input: mailInput, valid: valid)
    }
    
    func showValidationError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error de validación", message: "Por favor revisa los campos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    private func didUpdateValidation(input: UITextField, valid: Bool) {
        DispatchQueue.main.async {
            input.backgroundColor = valid ? .systemBackground : .systemRed
        }
    }
    
    func registerNotifications() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

        @objc func keyboardWillShow(notification: NSNotification){
            guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            scrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
        }

        @objc func keyboardWillHide(notification: NSNotification){
            scrollView.contentInset.bottom = 0
        }

    
}

extension UserFormViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        presenter?.didUpdateBio(textView.text)
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
