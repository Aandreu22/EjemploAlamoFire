//
//  MealsViewController.swift
//  EjemploAlamoFire
//
//  Created by andreu navarro donderis on 29/01/2024.
//

import UIKit
import Alamofire
import AlamofireImage

class MealsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tablaComidas: UITableView!

    var categoria: String!
    var listaComidas: [Meal]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listaComidas = []
        cargarComidas()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaComidas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "MEALSCELDA") as! CeldaTableViewCell
        
        celda.lblNombre.text = listaComidas[indexPath.row].strMeal
        
        AF.request(listaComidas[indexPath.row].strMealThumb).responseImage(){
            imagen in
            if case .success (let img) = imagen.result{
                celda.imgFoto.image = img
            }
        }
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MEAL"{
        let destino = segue.destination as! MealViewController
        
            let fila = tablaComidas.indexPathForSelectedRow!.row
            destino.id = listaComidas[fila].idMeal
            
        }
        
    }
    
    func cargarComidas() {
        ApiConexiones.api.getMeals(category: categoria){
            respuesta in
            self.listaComidas = respuesta
            self.tablaComidas.reloadData()
        }failure: {
            error in
            print("ERROR \(error.debugDescription)")
        }
    }
    
    
    
   
}
