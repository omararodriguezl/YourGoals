//
//  FinishGoalVC.swift
//  YourGoals
//
//  Created by Omar Rodriguez on 11/26/22.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var createGoalBtn: UIButton!
    
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType){
        self.goalType = type
        self.goalDescription = description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyBoard()
        pointsTextField.delegate = self
    }
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        if pointsTextField.text != "" {
            self.save { complete in
                if complete {
                    dismiss(animated: false, completion: nil)
                }
            }
        }

    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    func save(completion: (_ finished: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription =  goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        do {
            try managedContext.save()
            print ("Successfully save data")
            completion(true)
        }catch{
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
        
    }
}
