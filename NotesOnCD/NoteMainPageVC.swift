//
//  ViewController.swift
//  NotesOnCD
//
//  Created by Леонид on 19.06.2021.
//

import UIKit
import CoreData

class NoteMainPageVC: UITableViewController {
    //объект данных из CD
    var notes: [NSManagedObject] = []
    let cdManager = CDManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadNotesTV), name: NSNotification.Name(rawValue: "reloadNotesTV"), object: nil)
        
    }

    //перепопределение одного из методов ЖЦ VC для загрузки данных из CoreData
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        notes = cdManager.takeDataFromEntity()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        cell.noteNameLabel.text = note.value(forKey: "noteName") as? String
        cell.noteTextLabel.text = note.value(forKey: "note") as? String
        
        let date = note.value(forKey: "dateOfCreation") as? Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        cell.dateLabel.text = dateFormatter.string(from: date!)
        
        return cell
    }
    
    @IBAction func sortingPressed(_ sender: Any) {
        //добавить сортировку по дате и по имени
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        cdManager.deleteNote(notes[indexPath.row])
        notes = cdManager.takeDataFromEntity()
        self.tableView.reloadData()
    }
    
    @objc func reloadNotesTV () {
        notes = cdManager.takeDataFromEntity()
        self.tableView.reloadData()
    }
}




