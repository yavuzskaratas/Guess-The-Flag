//
//  ViewController.swift
//  Project3-2
//
//  Created by Yavuz Selim Karataş on 28.01.2022.
//

import UIKit

class ViewController: UIViewController {
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAnswered = 0
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var scoreBar: UILabel!
    @IBOutlet var resetButton: UIButton!
    override func viewDidLoad() {
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        super.viewDidLoad()
        askQuestion()
        button1.layer.borderWidth = 2
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 2
        button1.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderColor = UIColor.black.cgColor
        button3.layer.borderColor = UIColor.black.cgColor
    }
    func resetGame(action: UIAlertAction! = nil){
        score = 0
        questionsAnswered = 0
        correctAnswer = 0
        askQuestion()
    }
    
    func askQuestion(action : UIAlertAction! = nil){
        correctAnswer = Int.random(in: 0...2)
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "Which one is the flag of " + countries[correctAnswer].uppercased() + "?"
        scoreBar.text = """
Your Score: \(score)
"""

    }
    func showAlert(){
        let alert = UIAlertController(title: "Game Over", message: "Final score: \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play Again", style: .destructive, handler:resetGame))
        alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler:askQuestion))
        present(alert, animated: true)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        title = "Restart"
        resetGame()
    }
    //GIVING A ROLE TO BUTTON
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String
        if sender.tag == correctAnswer {
            title = "Correct "
            score += 1
            questionsAnswered += 1
        }
        else {
            title = "Incorrect, that is the flag of \(countries[sender.tag])"
            score -= 1
            questionsAnswered += 1
        }
       if questionsAnswered == 10 {
           showAlert()
       }
        else if questionsAnswered == 10 && score == 10 {
            title = "Great work! All correct."
        }
        //OUTCOME WHEN ANSWER CHOSEN
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default,handler: askQuestion))
        present(ac, animated: true)
    }
    
}

