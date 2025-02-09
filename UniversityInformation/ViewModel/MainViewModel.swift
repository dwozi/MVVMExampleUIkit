//
//  MainViewModel.swift
//  UniversityInformation
//
//  Created by Hakan Hardal on 6.05.2024.
//

import Foundation

class MainViewModel{
    
    var dataResult : [University] = []
    
    
    func getData(completion: @escaping([University]?)->Void){
        Service.getData {[weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let dataResult):
                self.dataResult = dataResult
                completion(self.dataResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
   
    func numberOfSections() -> Int{
        return 1
    }
    
    func numberOfRowsInSection(_ section:Int) -> Int {
        return self.dataResult.count
    }
    
    func createMainCellViewModel(model: University ) -> MainViewCellModel{
        let cellModel =  MainViewCellModel(model: model)
        
        return cellModel
    }
   
}
