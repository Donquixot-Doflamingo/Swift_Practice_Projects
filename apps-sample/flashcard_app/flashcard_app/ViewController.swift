//
//  ViewController.swift
//  flashcard_app
//
//  Created by harsh Khandelwal on 05/06/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var cardContentLabel: UILabel!
    
    enum displayModel {
        case  questionFirst
        case  answerFirst
    }
    
    var currentDisplayModel : displayModel = .questionFirst
    
    var managedObjectContext : NSManagedObjectContext!
    var listOfCards = [FlashCard]()
    var currentCard : FlashCard?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        // Do any additional setup after loading the view.
        fetchCards()
    }
    
    //this is used because when we save the card and get back to the main screen the card wouldn't save, but with this fuction when this page appears again it will save th changes
    override func viewDidAppear(_ animated: Bool) {
        fetchCards()
    }

    func fetchCards(){
        let fetchRequest : NSFetchRequest<FlashCard> =  FlashCard.fetchRequest()
    
        do {
             listOfCards = try managedObjectContext.fetch(fetchRequest)
             print("Flashcard fetched successfully")
        } catch {
            print("couldn't save managedObjectContext, Flashcard not saved ")
        }
        
    }

    func displayCard(){
        let randomIndex = Int(arc4random_uniform(UInt32(listOfCards.count)))
        
        currentCard = listOfCards[randomIndex]
        
        if let displayCard = currentCard {
            displayQuestionOrAnswer(cardToDisplay: displayCard)
        } else{
            cardContentLabel.text = "no cards in the list"
            print("no cards in the list")
        }
    }
    
    func displayQuestionOrAnswer(cardToDisplay card : FlashCard){
        switch currentDisplayModel {
        case .questionFirst:
            cardContentLabel.text = card.question
        case .answerFirst:
            cardContentLabel.text = card.question
        }
    }
    
    @IBAction func chooseDisplayModeAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentDisplayModel = .questionFirst
        case 1:
            currentDisplayModel = .answerFirst
        default:
            currentDisplayModel = .questionFirst
        }
    }
    
    @IBAction func deleteCardAction(_ sender: UIButton) {
        if currentCard == nil{
            return
        } else {
            managedObjectContext.delete(currentCard!)
        }
    }
    
    @IBAction func swipeRightAction(_ sender: UISwipeGestureRecognizer) {
         displayCard()
    }
    
    @IBAction func swipeUpAction(_ sender: UISwipeGestureRecognizer) {
        if let card = currentCard {
            cardContentLabel.text = card.question
        }
    }
    
    @IBAction func swipeDownAction(_ sender: UISwipeGestureRecognizer) {
        if let card = currentCard {
            cardContentLabel.text = card.answer
        }
        
        do {
            try managedObjectContext.save()
            print("flashcard successfully deleted")
            fetchCards()
            displayCard()
        } catch{
            print("flashcard not deleted")
        }
        
    }
}

