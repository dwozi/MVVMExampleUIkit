//
//  Service.swift
//  UniversityInformation
//
//  Created by Hakan Hardal on 6.05.2024.
//

import Foundation
import Alamofire
enum serviceError: Error {
    case urlError
    case decodingError
}

class Service{
    
    static func getData(completion: @escaping(Result<[University],serviceError>)->Void){
        AF.request(ServiceConstant.shared.url).response { response in
            
            if response.error != nil{
                completion(.failure(.urlError))
            }
            
            guard let data = response.data else {return}
            do{
                let dataResult = try JSONDecoder().decode([University].self, from: data)
                
                completion(.success(dataResult))
            }catch{
                completion(.failure(.decodingError))
            }
            
        }
        
    }
    
}
