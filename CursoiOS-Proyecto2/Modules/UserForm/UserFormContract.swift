//
//  UserFormContract.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 25/1/22.
//

import Foundation
import UIKit

protocol UserFormViewContract: UIViewController {
    var presenter: UserFormPresenterContract? {get set}
}

protocol UserFormPresenterContract {
    var view: UserFormViewContract? {get set}
    
    func didUpdateName(_ name: String?)
    func didUpdateLastName(_ lastname: String?)
    func didUpdatePhone(_ phone: String?)
    func didUpdateMail(_ mail: String?)

    
}
