//
//  BeschreibungTableViewController.swift
//  Projekt_LiftingApp
//
//  Created by Stefanie Miebach / BBS2H20A on 21.12.21.
//

import UIKit

class BeschreibungTableViewController: UITableViewController {

    
  
    @IBOutlet weak var übungLabel: UILabel!
    @IBOutlet weak var eImage: UIImageView!
    @IBOutlet weak var KoerpergruppeLabel: UILabel!
    @IBOutlet weak var ausfuehrungLabel: UILabel!
    @IBOutlet weak var wiederholungenLabel: UILabel!
    
    var exercise : Model?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        
        übungLabel.text = exercise?.übung
        eImage.image = UIImage(named: exercise?.imageName ?? "Squats")
        KoerpergruppeLabel.text = exercise?.körpergruppe
        ausfuehrungLabel.text = exercise?.ausführung
        wiederholungenLabel.text = exercise?.wiederholungen
        
          
    }
}
