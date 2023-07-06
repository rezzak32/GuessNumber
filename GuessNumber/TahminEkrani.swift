//
//  TahminEkrani.swift
//  GuessNumber
//
//  Created by Rezzak on 6.07.2023.
//

import UIKit

class TahminEkrani: UIViewController {

    @IBOutlet weak var labelRemaining: UILabel!
    @IBOutlet weak var labelHint: UILabel!
    @IBOutlet weak var guessField: UITextField!
    
    var randomNumber:Int?
    var remainingGuess = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(50)) // Generates random number between 0-50
        print("Random number is \(randomNumber!)")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let incomingData = sender as? Bool {
            let destinationVC = segue.destination as! SonucEkrani
            destinationVC.result = incomingData
        }
    }
    
    @IBAction func guessNumber(_ sender: Any) {
        labelHint.isHidden = false
        remainingGuess-=1
        
        if let data = guessField.text {
            
            if let guess = Int(data){
                
                if guess > 50 {
                    labelHint.text = "Too High"
                }
                
                if guess == randomNumber {
                    let result = true
                    performSegue(withIdentifier: "guessToresult", sender: result)
                    return
                }
                
                if guess > randomNumber! && guess < 50 {
                    labelHint.text = "Lower"
                    labelRemaining.text = "Remaining guess: \(remainingGuess)"
                }
                
                if guess < randomNumber! {
                    labelHint.text = "Higher"
                    labelRemaining.text = "Remaining guess: \(remainingGuess)"
                }
                
                if remainingGuess == 0 {
                    let result = false
                    performSegue(withIdentifier: "guessToresult", sender: result)
                }
                
                guessField.text = ""
                
            }
            
        }
    }
    
}
