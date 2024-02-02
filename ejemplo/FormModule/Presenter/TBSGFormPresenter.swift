//
//  TBSGFormPresenter.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 29/01/24.
//

import Foundation

protocol TBSGFormPresenterProtocol {
    var selectedOptions: [TBGSFormSelectableOption] { get }
    var cellsData: [TBSGFormEnum] { get }

    func getBaseFormData()
    func openMultipleCase()
    func closeMultipleCase()
    func updateSelectedOption(id: Int)
}

class TBSGFormPresenter: TBSGFormPresenterProtocol {
    
    var cellsData: [TBSGFormEnum] = []
    var selectedOptions: [TBGSFormSelectableOption] = []
    var baseOption: [TBGSFormSelectableOption] = []

    func getBaseFormData() {
        cellsData = [.formTextInputCell(model: getInputCellData()), .formDownInputCell(model: getDownInputCellData())]
    }
    
    func closeMultipleCase() {
        cellsData.removeLast()
    }
    
    func openMultipleCase() {
        cellsData.append(.formMultipleCaseCell(model: getMultipleCaseCellData()))
    }
    
    func updateSelectedOption(id: Int) {
        if let index = selectedOptions.firstIndex(where: { $0.id == id }) {
            selectedOptions.remove(at: index)
        } else {
            if let option = baseOption.first(where: { $0.id == id }) {
                selectedOptions.append(option)
            }
        }
    }
    
    private func getDownInputCellData() -> TBGSFormDownInputDataModel {
        let tbsgDataModel = TBGSFormDownInputDataModel(title: "Peliculas")
        return tbsgDataModel
    }
    
    private func getMultipleCaseCellData() -> TBGSFormMultipleCaseDataModel {
        let movie1 = TBGSFormSelectableOption(id: 1, title: "Planeta del Tesoro")
        let movie2 = TBGSFormSelectableOption(id: 2, title: "Lilo y Stich")
        let movie3 = TBGSFormSelectableOption(id: 3, title: "La dama y el Vagabundo")
        let movie4 = TBGSFormSelectableOption(id: 4, title: "101 Dalmata")

        baseOption = [movie1, movie2, movie3, movie4]
        let tbsgDataModel = TBGSFormMultipleCaseDataModel(optionsData: baseOption)
        return tbsgDataModel
    }
    
    private func getInputCellData() -> TBSGFormTextInputDataModel {
        let tbsgDataModel = TBSGFormTextInputDataModel(title: "IronMan",
                                                       placeholder: "Escribir Aqui",
                                                       defaultWarningMessage: "Error Nigga")
        return tbsgDataModel
    }
}
