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
    
    func getCategories(success:@escaping(_ respuesta: [Categorias]?)->(),
                       failure: @escaping(_ error:Error)->()){
        
        let url = "\(BASE_URL)/api/json/v1/1/categories.php"
            
            AF.request(url,method: .get).validate(statusCode: 200...299).responseDecodable(of: Categorias.self){
                respuesta in
                if let res = respuesta.value{
                    print(res.categories)
                }else{
                    print(respuesta.error?.responseCode)
                }
            }
        
    }
   
    
   
}
