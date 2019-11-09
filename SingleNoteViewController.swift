//
//  SingleNoteViewController.swift
//  Notes
//
//  Created by Ethan Cain on 11/8/19.
//  Copyright © 2019 ethancain. All rights reserved.
//

import UIKit
import CoreData

class SingleNoteViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self as? UITextFieldDelegate
        bodyTextField.delegate = self as? UITextFieldDelegate
    }
    
    override func didReceiveMemoryWarning () {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        bodyTextField.resignFirstResponder()
    }
    
    @IBAction func saveNote(_ sender: Any) {
        let name = nameTextField.text
        let body = bodyTextField.text
        let date = datePicker.date
        
        if let note = Note(name: name, body: body, date: date) {
            do {
                let managedContext = note.managedObjectContext
                try managedContext?.save()
                self.navigationController?.popViewController(animated: true)
            }
            catch {
                print("Context could not be saved")
            }
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
