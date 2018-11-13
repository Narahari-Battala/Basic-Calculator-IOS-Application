//
//  ViewController.swift
//  Inclass02b
//
//  Created by Hari on 10/21/18.
//  Copyright © 2018 Narahari. All rights reserved.
//
// Assignment : Inclass02b
// FileName : ViewController.swift
// Name : Narahari Battala

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var selected = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func selectedSegment(_ sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex
        {
            
        case 0:
            print("Add")
            selected = 0
        case 1:
            print("Subtract")
            selected = 1
        case 2:
            print("Multiply")
            selected = 2
        case 3:
            print("divide")
            selected = 3
        default:
            print("")
        }
        
        
    }
    
    @IBAction func operation(_ sender: UIButton) {
        
        let first = Double(firstNumber.text!)
        let second = Double(secondNumber.text!)
        
        switch selected{
            
        case 0:
            if (validate())
            {
                result.text = "Result : \(first! + second!)"
            }
        case 1:
            if (validate())
            {
                result.text = "Result : \(first! - second!)"
            }
        case 2:
            if (validate())
            {
                result.text = "Result : \(first! * second!)"
            }
        case 3:
            if (validate())
            {
                if ((second) != 0.0){
                result.text = "Result : \(first! / second!)"
                }
                else {
                    
                    let alert = UIAlertController(title: "Invalid Second Number", message: "Second Number cannot be 0", preferredStyle:.alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        default:
            print("")
        }
        
    }
    
    @IBAction func clearAll(_ sender: UIButton) {
        
        firstNumber.text = ""
        secondNumber.text = ""
        result.text = "Result : 0.00 "
        selected = 0
        segmentedControl.selectedSegmentIndex = 0
        
    }
    
    func validate() -> Bool {
        
        let first = Double(firstNumber.text!)
        let second = Double(secondNumber.text!)
        
        if (firstNumber.text == nil || (firstNumber.text?.isEmpty)! || first == nil){
            
            let alert = UIAlertController(title: "Invalid First Number", message: "Enter a valid First Number", preferredStyle:.alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        
        if (secondNumber.text == nil || (secondNumber.text?.isEmpty)! || second == nil){
            
            let alert = UIAlertController(title: "Invalid Second Number", message: "Enter a valid Second Number", preferredStyle:.alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        
        return true
        
    }
}

