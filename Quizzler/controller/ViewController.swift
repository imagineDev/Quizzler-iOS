//
//  ViewController.swift
//  Quizzler
//
//  Created by Sahil Sharma on 17/04/18.
//  Copyright © 2018 Sahil Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    var questionList = [Question]()
    var questionNumber = 0
    var score = 0
    let scoreWeight = 10
    var questionTotalCount: Int = 0
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionList = QuestionBank().questionList
        questionTotalCount = questionList.count
        
        startOver()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    @IBAction func onAnswerBtnAction(_ sender: UIButton) {
   
    
        let usersAnswer: Bool
        
        if(sender.tag == 1)
        {
            //True button
            usersAnswer = true
        }
        else if(sender.tag == 2){
            //False button
            usersAnswer = false
        }
        else{
            usersAnswer = false
        }
        
        if(usersAnswer == questionList[questionNumber].correctAnswer)
        {
            //Correct Answer
            score += scoreWeight
            ProgressHUD.showSuccess("Thats correct!")
        }
        else
        {
            //Wrong Answer
            ProgressHUD.showError("Wrong!")
        }
        
        
        if(questionNumber + 1 >= questionTotalCount)
        {
            //THE END
            let titleTxt = "Quiz End"
            let scoreTxt = "Your score is '\(score)' out of \(questionTotalCount * scoreWeight)"
            
            
            let myalert = UIAlertController(title: titleTxt, message: scoreTxt, preferredStyle: UIAlertControllerStyle.alert)
            
            myalert.addAction(UIAlertAction(title: "Restart Quiz", style: .default) { (action:UIAlertAction!) in
                self.startOver()
            })
            myalert.addAction(UIAlertAction(title: "Quit", style: .cancel) { (action:UIAlertAction!) in
                self.exitApp()
            })
            
            self.present(myalert, animated: true)
            
        }
        else{
            nextQuestion()
        }
        
    
    }
   
    
    func displayQuestion()
    {
       questionNumberLabel.text = "\(questionNumber+1)/\(questionTotalCount)"
        
       questionTextLabel.text = questionList[questionNumber].questionText
        
        scoreLabel.text = "Score: \(score)"
        
        progressView.frame.size.width = (view.frame.size.width / CGFloat(questionTotalCount)) * CGFloat((questionNumber+1))
        
    }
    
    func nextQuestion()
    {
        questionNumber += 1
        displayQuestion()
    }
    
    func startOver()
    {
        questionNumber = 0
        score = 0
        displayQuestion()
    }
    
    func exitApp()
    {
        let alert = UIAlertController.init(title: "Quizzler", message: "Before you quit the application you should say thank you to 'Batman' for creating this app and ofcourse for saving the world", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction.init(title: "Thank You and Quit !", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction) in
            
            exit(0)
            
        }))
        present(alert, animated: true)
    }
    
    
    
}

