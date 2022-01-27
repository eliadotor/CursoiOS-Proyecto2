//
//  PermissionsPresenter.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 27/1/22.
//

import Foundation

protocol PermissionsViewContract: AnyObject {
    func setAllowed()
    func setNotAllowed()
    func openSetting()
}
enum PermissionsInteractorStatus {
    case allowed, denied, unknown
}
protocol PermissionaInteractorContract: AnyObject {
    var output: PermissionsInteractorOutputContract? {get set}
    var currentPermission: PermissionsInteractorStatus {get}
    func askForPermission()
}

protocol PermissionsInteractorOutputContract: AnyObject {
    func didUpdatePermission(status: PermissionsInteractorStatus)
}
class PermissionsPresenter {
    
    private let interactor: PermissionaInteractorContract?
    init(interactor: PermissionaInteractorContract?) {
        self.interactor = interactor
    }
    weak var view: PermissionsViewContract? {
        didSet {
            guard let status = interactor?.currentPermission else {return}
            interactor?.output = self
            didUpdatePermission(status: status)
        }
    }
}

extension PermissionsPresenter: PermissionsInteractorOutputContract {
    func didUpdatePermission(status: PermissionsInteractorStatus) {
        switch status {
        case .allowed:
            view?.setAllowed()
        case .denied, .unknown:
            view?.setNotAllowed()
        }
    }
}
extension PermissionsPresenter: PermissionPresenterContract {
    func didPressPermissionsButton() {
        guard let status = interactor?.currentPermission else {return}
        switch status {
        case .allowed:
            break
        case .denied: //open settings
            view?.openSetting()
        case .unknown:
            interactor?.askForPermission()
        }
    }
    
    
}
