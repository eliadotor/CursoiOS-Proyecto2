//
//  UserFormPresenter.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 25/1/22.
//

import Foundation


class UserFromPresenter: UserFormPresenterContract {
    var view: UserFormViewContract?
    
    private var userFormModel = UserFormModel(name: nil, lastName: nil, phone: nil, mail: nil) {
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
    
    
}
