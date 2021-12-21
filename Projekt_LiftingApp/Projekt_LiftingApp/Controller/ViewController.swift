//
//  ViewController.swift
//  Projekt_LiftingApp
//
//  Created by Stefanie Miebach / BBS2H20A on 21.12.21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    
    
    var allExercise = exercisedata
    var selectedExercise: Model?
    var filteredExercise = exercisedata
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        myTableView.dataSource = self
        myTableView.delegate = self
        mySearchBar.delegate = self
        
        myTableView.rowHeight = 100
        myTableView.keyboardDismissMode = .onDrag
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBeschreibung" {
            //Zugriff auf den "Ziel VC"
            let zielTableVC = segue.destination as! BeschreibungTableViewController
            zielTableVC.exercise = selectedExercise
        }
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Design - nach click auf die TableViewCell, soll diese nicht mehr "markiert" sein
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        selectedExercise = filteredExercise[indexPath.row]
        //Segue soll an dem bestimmten indexPath der TableView ausgeführt werden
        performSegue(withIdentifier: "showBeschreibung", sender: nil)
    }
}


extension ViewController: UITableViewDataSource {
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredExercise.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Setzen der Cell auf unser CustomCell mit Identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        
    
        cell.exLabel.text = filteredExercise[indexPath.row].übung
        cell.exerciseImage.image = UIImage(named: filteredExercise[indexPath.row].imageName)
        
        return cell
    }
}


extension ViewController: UISearchBarDelegate {
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
   
        let searchText = searchText.lowercased()
        
      
        if searchText != "" {
       
            filteredExercise = allExercise.filter({ exercise in
                
                if exercise.übung.lowercased().contains(searchText) {
                    return true
                }
                return false
            })
    
        } else {
            
            filteredExercise = allExercise
        }
        print(filteredExercise)
        self.myTableView.reloadData()
    }
}

    
    
    
  



