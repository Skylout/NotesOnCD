//
//  NoteCell.swift
//  NotesOnCD
//
//  Created by Леонид on 20.06.2021.
//

import UIKit

class NoteCell: UITableViewCell {
    @IBOutlet weak var noteNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noteTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
