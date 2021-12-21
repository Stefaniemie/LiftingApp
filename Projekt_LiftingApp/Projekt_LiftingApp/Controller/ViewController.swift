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
    
    
    //MARK: - Data
    //Unsere Daten
    //var games = ["Far Cry 6", "Battlefield 2042", "Fifa 22", "Back4Blood", "Hot Wheels Unleashed", "Forza Horizon 5", "Call of Duty Vanguard", "Riders Republic"]
    var allExercise = exercisedata
    var selectedExercise: Model?
    var filteredExercise = exercisedata
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Zugriff auf unsere Datensätze
        myTableView.dataSource = self
        myTableView.delegate = self
        mySearchBar.delegate = self
        
        //Design
        myTableView.rowHeight = 100
        myTableView.keyboardDismissMode = .onDrag
    }

    //MARK: - Segues
    //Den nächsten VC "vorbereiten" anhand des Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBeschreibung" {
            //Zugriff auf den "Ziel VC"
            let zielTableVC = segue.destination as! BeschreibungTableViewController
            zielTableVC.exercise = selectedExercise
        }
    }
}

//MARK: - TableView Delegate
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

//MARK: - TableView DataSource
extension ViewController: UITableViewDataSource {
    
    //Die Anzahl der TableViewCells, basierend auf unser Daten-Array(-Objekt)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredExercise.count
    }
    
    //Was soll in der TableViewCell angezeigt werden -> CustomCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Setzen der Cell auf unser CustomCell mit Identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        
        //Bild und Text werden gesetzt, basierend auf unser Game-Objekt
        cell.exLabel.text = filteredExercise[indexPath.row].übung
        cell.exerciseImage.image = UIImage(named: filteredExercise[indexPath.row].imageName)
        
        return cell
    }
}

//MARK: - Searchbar Delegate
extension ViewController: UISearchBarDelegate {
    
    //Funktion wird ausgeführt bei jeder Eingabe in der SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        //Die Eingabe des Users soll in Klein-Schreibung umgewandelt werden
        let searchText = searchText.lowercased()
        
        //Wird ausgeführt wenn die Eingabe nicht leer ist:
        if searchText != "" {
            //Unser Filter
            filteredExercise = allExercise.filter({ exercise in
                //Die Datensätze sollen in Klein-Schreibung umgewandelt und überprüft werden
                if exercise.übung.lowercased().contains(searchText) {
                    return true
                }
                return false
            })
            //Wird ausgeführt wenn die Eingabe leer ist:
        } else {
            //Hier sollen alle Games angezeigt werden, wenn keine Eingabe getätigt wurde
            filteredExercise = allExercise
        }
        print(filteredExercise)
        //Die TableView soll während jeder Eingabe neugeladen werden
        self.myTableView.reloadData()
    }
}

    
    
    
  



