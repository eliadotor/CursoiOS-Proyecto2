//
//  UserFormPresenter.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 25/1/22.
//

import Foundation


class UserFromPresenter: UserFormPresenterContract {
    
    
    var view: UserFormViewContract?
    //Esto iría en el interactor
    private let fileManager: FileManager
    private let filename: String
    
    init(fileManager: FileManager = FileManager.default, filename: String = "userData") {
        self.fileManager = fileManager
        self.filename = filename
    }
    private var fileUrl: URL? {
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(filename).plist")
        print(url)
        return url
    }
    //
    func didLoad() {
        fetchUser()
    }
    private var userFormModel = UserFormModel(name: nil, lastName: nil, phone: nil, mail: nil, bio: nil) {
        didSet {
            print(userFormModel)
        }
    }
    
    func didUpdateName(_ name: String?) {
        userFormModel.name = name
        view?.didValidateName(userFormModel.isValidName)
    }
    
    func didUpdateLastName(_ lastname: String?) {
        userFormModel.lastName = lastname
        view?.didValidateLastName(userFormModel.isValidLastName)
    }
    
    func didUpdatePhone(_ phone: String?) {
        userFormModel.phone = phone
        view?.didValidatePhone(userFormModel.isValidPhone)
    }
    
    func didUpdateMail(_ mail: String?) {
        userFormModel.mail = mail
        view?.didValidateMail(userFormModel.isValidMail)
    }
    
    func didUpdateBio(_ bio: String?) {
        userFormModel.bio = bio
    }
    
    func didPressSend() {
        guard userFormModel.isValid else {
            view?.showValidationError()
            print("retry")

            return
        }
        print("success")
        saveUser(userFormModel)
    }
}


private extension UserFromPresenter {
    func fetchUser() {
        loadUser { user in
            guard let user = user else {
                return
            }
            self.userFormModel = user
            self.view?.configure(with: user.toFormViewModel)
        }
    }
    func saveUser(_ user: UserFormModel) {
        guard let url = fileUrl else {
            return
        }
        let encoder = PropertyListEncoder()
        //encoder.outputFormat = PropertyListSerialization.PropertyListFormat.xml
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(user)
            try data.write(to: url)
        } catch {
            
        }
    }
    
    func loadUser(_ completion: @escaping (UserFormModel?) -> ()) {
        DispatchQueue.global().async {
            guard let url = self.fileUrl else {
                completion(nil)
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                completion(nil)
                return
            }
            
            do {
                let user = try PropertyListDecoder().decode(UserFormModel.self, from: data)
                completion(user)
            } catch {
                
            }
        }
    }
}
