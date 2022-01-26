//
//  ViewController.swift
//  hangman_app
//
//  Created by harsh Khandelwal on 25/05/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var wordToGuessLabel: UILabel!
    @IBOutlet weak var noOfGuessesLeftLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var letterBankLabel: UILabel!
    
    let LIST_OF_WORDS : [String] = ["hello","goodbye","pranshu","hangman","sakshi","mansi"]
    let LIST_OF_HINTS : [String] = ["baat kse shuru karte hai","kabhi shakal na dikhana bolne ke liye","maha chutiya insaan","game ka name","bestoo friendo","ignore kar ri hai"]
    var wordToGuess : String!
    var wordAsUnderscores : String = ""
    var MAX_NO_OF_GUESS : Int = 5
    var guessessRemaining : Int!
    var oldRandomNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputTextField.delegate = self
        inputTextField.isEnabled = false
    }
    
    //implementation finished
    func chooseRandomNumber() -> Int {
        var newRandomNumber : Int = Int(arc4random_uniform(UInt32(LIST_OF_WORDS.count)))
        if newRandomNumber == oldRandomNumber {
            newRandomNumber = chooseRandomNumber()
        } else{
            oldRandomNumber = newRandomNumber
        }
        return newRandomNumber
    }
    
    
    func processCorrectGuess(letterGuessed : String) {
        let characterGuessed = Character(letterGuessed)
        
        for index in wordToGuess.indices {
            if wordToGuess[index] == characterGuessed{
                let endIndex = wordToGuess.index(after: index)
                let charRange = index ..< endIndex
                wordAsUnderscores = wordAsUnderscores.replacingCharacters(in: charRange, with: letterGuessed)
                wordToGuessLabel.text = wordAsUnderscores
            }
        }
        if !(wordAsUnderscores.contains("_")) {
            noOfGuessesLeftLabel.text = "You Won :)"
            noOfGuessesLeftLabel.backgroundColor = UIColor.green
            noOfGuessesLeftLabel.textColor = UIColor.blue
            inputTextField.isEnabled = false
        }
    }
    
    func processIncorrectGuess() {
        guessessRemaining! -= 1
        if guessessRemaining == 0{
            inputTextField.isEnabled = false
            noOfGuessesLeftLabel.text = "You lost :("
            noOfGuessesLeftLabel.textColor = UIColor.yellow
            noOfGuessesLeftLabel.backgroundColor = UIColor.red
            
        }else{
            noOfGuessesLeftLabel.text = "\(guessessRemaining!) : Guesses left"
        }
    }
    
    //implementation finished
    func reset() {
        guessessRemaining = MAX_NO_OF_GUESS
        noOfGuessesLeftLabel.text = "\(guessessRemaining!) : Guesses left"
        wordAsUnderscores = ""
        inputTextField.text?.removeAll()
        letterBankLabel.text?.removeAll()
        inputTextField.isEnabled = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let letterGuessed = textField.text else {
            return
        }
        inputTextField.text?.removeAll()
        let currentLetterBank : String = letterBankLabel.text ?? ""
        if currentLetterBank.contains(letterGuessed) {
            return
        }else {
            if wordToGuess.contains(letterGuessed){
                processCorrectGuess(letterGuessed: letterGuessed)
            } else{
                processIncorrectGuess()
            }
            letterBankLabel.text?.append("\(letterGuessed), ")
        }
    }
    
    //implementation finished
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.resignFirstResponder()
        
        return true
    }
    //implementation finished
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedChars = NSCharacterSet.lowercaseLetters
        let startinglength = textField.text?.count ?? 0
        let lengthToAdd = string.count
        let lengthToReplace = range.length
        let newLength = startinglength + lengthToAdd - lengthToReplace
        
        if string.isEmpty {
            return true
        } else if newLength == 1 {
            if let _ = string.rangeOfCharacter(from: allowedChars, options: .caseInsensitive){
                return true
            }
        }
            return false
    }
    
    //implementation finished
    @IBAction func chooseNewWordAction(_ sender: UIButton) {
        reset()
        let index = chooseRandomNumber()
        
        wordToGuess = LIST_OF_WORDS[index]
        
        let hint = LIST_OF_HINTS[index]
        hintLabel.text = "Hint : \(hint), no of letters : \(wordToGuess.count)"
        print(hintLabel.text!)
        
        for _ in 1...wordToGuess.count {
            wordAsUnderscores.append("_")
        }
        wordToGuessLabel.text = wordAsUnderscores
    }
    
}

