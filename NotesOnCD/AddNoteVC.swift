//
//  AddNoteVC.swift
//  NotesOnCD
//
//  Created by Леонид on 19.06.2021.
//

import UIKit

class AddNoteVC: UIViewController {
    @IBOutlet weak var noteNameTF: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.layer.borderWidth = 1.0
        self.saveButton.layer.cornerRadius = 2.0
        self.noteNameTF.layer.cornerRadius = 2.0
    }
    
    @IBAction func saveInCD(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
