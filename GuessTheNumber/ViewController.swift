//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by George Arias on 12/12/18.
//  Copyright © 2018 George Arias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables
    // let is a constant
    // var is just a regular variable
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0
    
    //var for the button and text field
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    
    
    // Main
    override func viewDidLoad() {
        super.viewDidLoad()
       generateRandomNumber()
    }

    //Generates a number from 1 to 100
    func generateRandomNumber()
    {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }
    
    //Makes sure your guess is inbetween 1 and 100
    // Tells you how close you are to the number

    func validateGuess(_ guess: Int)
    {
        if guess < lowerBound || guess > upperBound
        {
            showBoundsAlert()
        }
        else if guess < numberToGuess
        {
            guessLabel.text = "Higher! ⬆️"
        }
        else if guess > numberToGuess
        {
            guessLabel.text = "Lower! ⬇️"
        }
        else
        {
            showWinAlert()
            numberOfGuesses = 0
            generateRandomNumber()
            guessLabel.text = "Guess The Number"
        }
        guessTextField.text = ""
        
    }
    
    // Alert for outside bounds
    func showBoundsAlert()
    {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //Alert that you won
    func showWinAlert()
    {
        let alert = UIAlertController(title: "Congratualtions 🤠", message: "You won with a total of \(numberOfGuesses) guesses", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play again", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    //If submit button is pressed then we must see if guess is valid and update # of guesses
    @IBAction func submitButtonPressed(_ sender: Any) {
    
        if let guess = guessTextField.text
        {
                if let guessInt = Int(guess)
                {
                        numberOfGuesses = numberOfGuesses + 1
                    validateGuess(guessInt)
                }
        }
    }
    
    

}

