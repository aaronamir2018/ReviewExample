//
//  TBSGFormCellsEnum.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 29/01/24.
//

import Foundation

enum TBSGFormEnum {
    case formTextInputCell(model: TBSGFormTextInputDataModel)
    case formDownInputCell(model: TBGSFormDownInputDataModel)
    case formMultipleCaseCell(model: TBGSFormMultipleCaseDataModel)
}

struct TBSGFormTextInputDataModel {
    var title: String?
    var placeholder: String?
    var defaultWarningMessage: String?
}

struct TBGSFormDownInputDataModel {
    var title: String?
    var subTitle: String?
}

struct TBGSFormMultipleCaseDataModel {
    var optionsData: [TBGSFormSelectableOption]
}

struct TBGSFormSelectableOption {
    var id: Int!
    var title: String!
}
