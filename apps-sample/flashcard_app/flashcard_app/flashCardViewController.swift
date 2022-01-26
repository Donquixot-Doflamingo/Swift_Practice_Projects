//
//  flashCardViewController.swift
//  flashcard_app
//
//  Created by harsh Khandelwal on 07/06/21.
//

import UIKit
import CoreData

class flashCardViewController: UIViewController {

    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answerTextView: UITextView!
    
    var managedObjectContext : NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveCardAction(_ sender: UIButton) {
        guard let question = questionTextView.text else {
            return
        }
        guard let answer = answerTextView.text else {
            return
        }
        saveCardToDatabase(question: question, answer: answer)
    }
    
    func saveCardToDatabase(question : String, answer : String){
        let newFlashcard = NSEntityDescription.insertNewObject(forEntityName: "FlashCard", into: managedObjectContext) as! FlashCard
        newFlashcard.question = question
        newFlashcard.answer = answer
        
        do {
            try managedObjectContext.save()
            print("Flashcard save successfully")
        } catch{
            print("couldn't save managedObjectContext, Flashcard not saved ")
        }
    }
    
}
