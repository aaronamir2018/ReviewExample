//
//  TBSGFormPresenter.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 29/01/24.
//

import Foundation

protocol TBSGFormPresenterProtocol {
    func getBaseFormData()
    func openMultipleCase()
    func closeMultipleCase()
    var cellsData: [TBSGFormEnum] { get }
}

class TBSGFormPresenter: TBSGFormPresenterProtocol {
    
    var cellsData: [TBSGFormEnum] = []
    
    func getBaseFormData() {
        cellsData = [.formTextInputCell(model: getInputCellData()), .formDownInputCell(model: getDownInputCellData())]
    }
    
    func closeMultipleCase() {
        cellsData.removeLast()
    }
    
    func openMultipleCase() {
        cellsData.append(.formMultipleCaseCell(model: getMultipleCaseCellData()))
    }
    
    private func getDownInputCellData() -> TBGSFormDownInputDataModel {
        let tbsgDataModel = TBGSFormDownInputDataModel(title: "Peliculas")
        return tbsgDataModel
    }
    
    private func getMultipleCaseCellData() -> TBGSFormMultipleCaseDataModel {
        let movie1 = TBGSFormSelectableOption(id: 1, title: "Pelicula 1")
        let movie2 = TBGSFormSelectableOption(id: 2, title: "Pelicula 2")
        let movie3 = TBGSFormSelectableOption(id: 3, title: "Pelicula 3")

        let tbsgDataModel = TBGSFormMultipleCaseDataModel(optionsData: [movie1, movie2, movie3])
        return tbsgDataModel
    }
    
    private func getInputCellData() -> TBSGFormTextInputDataModel {
        let tbsgDataModel = TBSGFormTextInputDataModel(title: "IronMan",
                                                       placeholder: "Escribir Aqui",
                                                       defaultWarningMessage: "Error Nigga")
        return tbsgDataModel
    }
}
