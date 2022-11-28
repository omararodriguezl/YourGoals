//
//  CreateGoalVCViewController.swift
//  YourGoals
//
//  Created by Omar Rodriguez on 11/24/22.
//

import UIKit

class CreateGoalVCViewController: UIViewController, UITextViewDelegate{

    @IBOutlet weak var goalTextView: UITextView!
    
    @IBOutlet weak var longTermBtn: UIButton!
    
    @IBOutlet weak var ShortTermBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyBoard()
        ShortTermBtn.setSelectedColor()
        longTermBtn.setDelectedColor()
        goalTextView.delegate = self
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?"{
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {return}
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            presentingViewController?.presentSecondaryDatail(finishGoalVC)
        }
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        ShortTermBtn.setSelectedColor()
        longTermBtn.setDelectedColor()
    }
    
    @IBAction func LongTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        ShortTermBtn.setDelectedColor()
        longTermBtn.setSelectedColor()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = .black
    }
 

}
