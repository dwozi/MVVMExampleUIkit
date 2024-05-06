//
//  MainViewControllerTableView.swift
//  UniversityInformation
//
//  Created by Hakan Hardal on 6.05.2024.
//

import Foundation
import UIKit

private let identifier = "cell"
extension MainViewController{
    
    func registerTableView(){
        tableView.register(MainViewCell.self, forCellReuseIdentifier: identifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MainViewCell
        
        cell.viewModel = viewModel.createMainCellViewModel(model: dataResult[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
