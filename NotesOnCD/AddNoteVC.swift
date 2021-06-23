//
//  AddNoteVC.swift
//  NotesOnCD
//
//  Created by Леонид on 19.06.2021.
//

import UIKit
import CoreData

class AddNoteVC: UIViewController {
    @IBOutlet weak var noteNameTF: UITextField!
    @IBOutlet weak var noteTF: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.layer.borderWidth = 1.0
        self.saveButton.layer.cornerRadius = 2.0
        self.noteNameTF.layer.cornerRadius = 2.0
        self.noteTF.layer.borderWidth = 1.0
        self.noteTF.layer.cornerRadius = 2.0
    }
    
    @IBAction func saveInCD(_ sender: UIButton) {
        guard let noteName = noteNameTF.text, let note = noteTF.text else {
//            self.present(createAlert("Не указаны основные данные"), animated: true)
            return
        }
        let createdNote = NoteModel(noteName: noteName, dateOfCreation: Date(), note: note)
        
        //принцип сохранения такой же, как и у взятия – создаем делегат приложения, берем контекст, берем сущность, берем наши данные, добавляем в контекст и сохраняем
        let cdManager = CDManager()
        cdManager.saveDataToEntity(createdNote)
        
        //не самое правильное решение, но оно работает
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadNotesTV"), object: nil)
        }
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

