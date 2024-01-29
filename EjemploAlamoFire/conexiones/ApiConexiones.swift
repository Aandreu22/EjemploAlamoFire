//
//  ApiConexiones.swift
//  EjemploAlamoFire
//
//  Created by andreu navarro donderis on 24/01/2024.
//

import Foundation
import Alamofire

final class ApiConexiones{
    
    static let api = ApiConexiones()
    
    let BASE_URL = "https://www.themealdb.com"
    
    func getCategories(success:@escaping(_ respuesta: [Category])->(),
                       failure: @escaping(_ error:Error?)->()){
        
        let url = "\(BASE_URL)/api/json/v1/1/categories.php"
            
            AF.request(url,method: .get).validate(statusCode: 200...299).responseDecodable(of: Categorias.self){
                respuesta in
                if let res = respuesta.value{
                    success(res.categories)
                }else{
                    failure(respuesta.error)
                }
            }
        
    }
   
    func getMeals(category: String, success:@escaping(_ respuesta: [Meal])->(),
                       failure: @escaping(_ error:Error?)->()){
        
        let url = "\(BASE_URL)/api/json/v1/1/filter.php"
        let parameters: Parameters = ["c": category]
            
            AF.request(url,method: .get, parameters: parameters).validate(statusCode: 200...299).responseDecodable(of: Meals.self){
                respuesta in
                if let res = respuesta.value{
                    success(res.meals)
                }else{
                    failure(respuesta.error)
                }
            }
        
    }
   
    
    func getMeal(id: String, success:@escaping(_ respuesta: Meal)->(),
                       failure: @escaping(_ error:Error?)->()){
        
        let url = "\(BASE_URL)/api/json/v1/1/lookup.php"
        let parameters: Parameters = ["i": id]
            
            AF.request(url,method: .get, parameters: parameters).validate(statusCode: 200...299).responseDecodable(of: Meals.self){
                respuesta in
                if let res = respuesta.value{
                    success(res.meals[0])
                }else{
                    failure(respuesta.error)
                }
            }
        
    }
}
