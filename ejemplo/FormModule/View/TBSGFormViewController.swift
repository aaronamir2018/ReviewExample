//
//  TBSGFormViewController.swift
//  ejemplo
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 29/01/24.
//

import UIKit

class TBSGFormViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60.0
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private var presenter: TBSGFormPresenterProtocol = TBSGFormPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
        setUpConstraint()
        setUpTableView()
    }
    
    private func setUpUi(){
        view.addSubview(tableView)
    }
    
    private func setUpConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setUpTableView() {
        presenter.getBaseFormData()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TBSGFormTextInputCell.self, forCellReuseIdentifier: TBSGFormTextInputCell.reuseIdentifier)
        tableView.register(TBSGFormDownInputCell.self, forCellReuseIdentifier: TBSGFormDownInputCell.reuseIdentifier)
        tableView.register(TBGSFormMultipleCaseCell.self, forCellReuseIdentifier: TBGSFormMultipleCaseCell.reuseIdentifier)
        tableView.reloadData()
    }
}

extension TBSGFormViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cellsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = presenter.cellsData[indexPath.row]
        switch cellType {
        case .formTextInputCell(model: let model):
            return getFormTextInputCell(forIndexPath: indexPath, withDataModel: model)
        case .formDownInputCell(model: let model):
            return getFormDownInputCell(forIndexPath: indexPath, withDataModel: model)
        case .formMultipleCaseCell(model: let model):
            return getFormMultipleCaseCell(forIndexPath: indexPath, withDataModel: model)
        }
    }
    
    func getFormTextInputCell(forIndexPath indexPath: IndexPath,
                                      withDataModel model: TBSGFormTextInputDataModel) -> UITableViewCell {
        let cell: TBSGFormTextInputCell = tableView.dequeueReusableCell(for: indexPath)
        cell.selectionStyle = .none
        cell.setUpCell(withModel: model)
        return cell
    }
    
    func getFormDownInputCell(forIndexPath indexPath: IndexPath,
                                      withDataModel model: TBGSFormDownInputDataModel) -> UITableViewCell {
        let cell: TBSGFormDownInputCell = tableView.dequeueReusableCell(for: indexPath)
        cell.selectionStyle = .none
        cell.delegate = self
        cell.setUpCell(withModel: model)
        return cell
    }
        
    func getFormMultipleCaseCell(forIndexPath indexPath: IndexPath,
                                          withDataModel model: TBGSFormMultipleCaseDataModel) -> UITableViewCell {
        let cell: TBGSFormMultipleCaseCell = tableView.dequeueReusableCell(for: indexPath)
        cell.selectionStyle = .none
        cell.setUpCell(withModel: model)
        return cell
    }
}

extension TBSGFormViewController: UITableViewDelegate {
}

extension TBSGFormViewController: TBSGFormDownInputCellProtocol {
    func buttonPressed() {
        if presenter.cellsData.count == 2 {
            presenter.openMultipleCase()
            tableView.insertRows(at: [IndexPath(row: 2, section: 0)], with: .top)
        }else{
            presenter.closeMultipleCase()
            tableView.deleteRows(at: [IndexPath(row: 2, section: 0)], with: .top)
        }
    }
}
