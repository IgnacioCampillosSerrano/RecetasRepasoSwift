//
//  MealsViewController.swift
//  RecetasRepasoSwift
//
//  Created by Ignacio Campillos Serrano on 24/01/2024.
//

//Logica de la ventana de Meals

import UIKit
import Alamofire
import AlamofireImage

class MealsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var tablaMeals: UITableView!
    
    var category:String!
    var listaMeals:[Meal]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listaMeals = []
        cargarComidas()
    }
    
    func cargarComidas(){
        ApiConexiones.api.getMeals(category: category){
            
            respuesta in
            
            self.listaMeals = respuesta
            self.tablaMeals.reloadData()
            
        } failure: {
            
            error in
            print(error.debugDescription)
        
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CELDAMEALS") as! CeldaCategoriesTableViewCell
        
        celda.lbName.text = listaMeals[indexPath.row].strMeal
        
        AF.request(listaMeals[indexPath.row].strMealThumb).responseImage{
            imagen in
            if case .success(let img) = imagen.result{
                celda.imPhoto.image = img
            }
        }
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "RECETA"{
            
            let destino = segue.destination as! RecetaViewController
            let fila = tablaMeals.indexPathForSelectedRow?.row
            destino.id = self.listaMeals[fila!].idMeal
        }
    }
}
