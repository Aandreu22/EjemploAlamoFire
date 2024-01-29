//
//  MealViewController.swift
//  EjemploAlamoFire
//
//  Created by andreu navarro donderis on 29/01/2024.
//

import UIKit
import Alamofire
import AlamofireImage

class MealViewController: UIViewController {

    @IBOutlet weak var imPhoto: UIImageView!
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbCategoria: UILabel!
    @IBOutlet weak var lbArea: UILabel!
    @IBOutlet weak var lbInstrucciones: UILabel!
    
    var id: String!
    var comida: Meal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarComida()
        
    }
    
    func cargarComida(){
        ApiConexiones.api.getMeal(id: id){
            respuesta in
            self.comida = respuesta
            self.lbNombre.text = self.comida.strMeal
            self.lbCategoria.text = self.comida.strCategory
            self.lbArea.text = self.comida.strArea
            self.lbInstrucciones.text = self.comida.strInstructions
            
            AF.request(self.comida.strMealThumb).responseImage{
                imagen in
                if case .success(let img) = imagen.result{
                    self.imPhoto.image = img
                }
            }
        }failure: {
           error in
            print("ERROR")
        }
    }

    @IBAction func btnGuardar(_ sender: Any) {
    }
    
    

}
