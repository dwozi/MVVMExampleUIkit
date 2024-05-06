//
//  MainViewController.swift
//  UniversityInformation
//
//  Created by Hakan Hardal on 6.05.2024.
//

import Foundation
import UIKit
class MainViewController : UITableViewController{
    
    // MARK: - Properties
    var viewModel = MainViewModel()
    var dataResult : [University] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        setup()
        
    }
    
}


// MARK: - Helpers

extension MainViewController{
    
    private func configureView(){
        view.backgroundColor = .systemBackground

    }
    private func configureNavigation(){
        self.navigationItem.title = "University"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    func setup(){
        configureView()
        registerTableView()
        getData()
        configureNavigation()
    }
    
    func getData(){
        viewModel.getData { [weak self] result in
            guard let self = self else {return}
          
            guard let resultdata = result else {return}
            self.dataResult = resultdata
        }
    }
}
