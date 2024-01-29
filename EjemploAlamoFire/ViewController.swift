//
//  ViewController.swift
//  EjemploAlamoFire
//
//  Created by andreu navarro donderis on 24/01/2024.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var listaCategorias: [Category] = []
    


    @IBOutlet weak var tablaCategorias: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaCategorias = []
        cargarCategorias()
        
       
    }
    
    func cargarCategorias(){
        ApiConexiones.api.getCategories(){
            
            respuesta in
            
            self.listaCategorias = respuesta
            self.tablaCategorias.reloadData()
            
        }failure: {
           error in
            print("Error")
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.listaCategorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CELDA") as! CeldaTableViewCell
        
        celda.lblNombre.text = listaCategorias[indexPath.row].strCategory
        
        AF.request(listaCategorias[indexPath.row].strCategoryThumb).responseImage(){
            imagen in
            if case .success (let img) = imagen.result{
                celda.imgFoto.image = img
            }
        }
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "MEALS"{
            let destino = segue.destination as! MealsViewController
            let fila = tablaCategorias.indexPathForSelectedRow!.row
            destino.categoria = listaCategorias[fila].strCategory
        }
    }
    
}

