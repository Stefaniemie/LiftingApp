//
//  CustomTableViewCell.swift
//  Projekt_LiftingApp
//
//  Created by Stefanie Miebach / BBS2H20A on 21.12.21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    

    @IBOutlet weak var exerciseImage: UIImageView!
    @IBOutlet weak var exLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        exerciseImage.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
