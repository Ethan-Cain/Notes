//
//  NotesViewController.swift
//  Notes
//
//  Created by Ethan Cain on 11/8/19.
//  Copyright © 2019 ethancain. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {

    @IBOutlet weak var notesTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        
        do {
            notes =  try managedContext.fetch(fetchRequest)
            
            notesTableView.reloadData()
        }
        catch {
            print("Fetch could not be performed")
        }
    }

    override func didReceiveMemoryWarning () {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addNewNote(_ sender: Any) {
        performSegue(withIdentifier: "showNote", sender: self)
    }
}
    extension NotesViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return notes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = notesTableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
            let note = notes[indexPath.row]
            cell.textLabel?.text = note.name
            if let date = note.date {
                cell.detailTextLabel?.text = dateFormatter.string(from: date)
            }
            return cell
        }
    }
    
    extension NotesViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showNote", sender: self)
        }
    }
