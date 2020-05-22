//
//  ViewController.swift
//  HWS-Classic-Project02-GuessTheFlag
//
//  Created by Glenn Drescher on 22/05/2020.
//  Copyright © 2020 Glenn Drescher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score: " + String(score), style: .done, target: .none, action: .none)
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
        } else {
            title = "Wrong!"
            score -= 1
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score: " + String(score), style: .done, target: .none, action: .none)
        
        let ac = UIAlertController(title: title, message: "Your new score is \(score)", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        if questionAsked == 10 {
            resetGame()
            return
        }
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setBackgroundImage(UIImage(named: countries[0]), for: .normal)
        button2.setBackgroundImage(UIImage(named: countries[1]), for: .normal)
        button3.setBackgroundImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
        questionAsked += 1
    }
    
    func resetGame() {
        let ac = UIAlertController(title: "Your final score: \(score)", message: "You have answered 10 questions. Your game will be reset now." , preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "New Game", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        score = 0
        questionAsked = 0
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score: " + String(score), style: .done, target: .none, action: .none)
    }


}

