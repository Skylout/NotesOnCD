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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadNotesTV), name: NSNotification.Name(rawValue: "reloadNotesTV"), object: nil)
        
    }

    //перепопределение одного из методов ЖЦ VC для загрузки данных из CoreData
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        notes = takeDataFromEntity()
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
    
    @objc func reloadNotesTV () {
        notes = takeDataFromEntity()
        self.tableView.reloadData()
    }
}

extension NoteMainPageVC {
    func takeDataFromEntity () -> [NSManagedObject] {
        var dataFromCD: [NSManagedObject] = []
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return dataFromCD }
        //взятие теущего контекста (если обобщать – то область данных) приложения
        let managedContext = appDelegate.persistentContainer.viewContext
        //инициализация запроса в сущность
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")
        do{
            dataFromCD = try managedContext.fetch(fetchRequest)
        } catch let error as NSError{
            //представляем алерт для информирования об ошибке взятия из сущности
            
        }
        return dataFromCD
    }
}


