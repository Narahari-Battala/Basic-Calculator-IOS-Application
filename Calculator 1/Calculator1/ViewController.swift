//
//  ViewController.swift
//  InClass01
//
//  Created by Hari on 10/21/18.
//  Copyright © 2018 Narahari. All rights reserved.
//
// Assignment : Inclass02a
// FileName : ViewController.swift
// Name : Narahari Battala

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func operation(_ sender: UIButton) {
        
        let title = sender.currentTitle!
        let first = Double(firstNumber.text!)
        let second = Double(secondNumber.text!)
        
        switch title {
        case "Add":
            if (validate()){
                self.result.text = "Result : \(String(first! + second!))"
            }
        case "Subtract":
            if (validate()){
                self.result.text = "Result : \(String(first! - second!))"
            }
        case "Multiply":
            if (validate()){
                //print("Multiply clicked")
                self.result.text = "Result : \(String(first! * second!))"
            }
        case "Divide":
            if (validate()){
                
                if ((second!) != 0.0){
                //print("Divide clicked")
                self.result.text = "Result : \(String(first! / second!))"
                }
                else {
                    
                    let alert = UIAlertController(title: "Invalid Second Number", message: "Second Number cannot be 0 for Division", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style:.cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        default:
            firstNumber.text = ""
            secondNumber.text = ""
            result.text = "Result : 0.00"
        }
        
        
    }
    
    func validate() -> Bool{
        
        let first = Double(firstNumber.text!)
        let second = Double(secondNumber.text!)
        
        if (firstNumber.text == "" || (firstNumber.text?.isEmpty)! || first == nil){
            
            let alert = UIAlertController(title: "Invalid First Number", message: "Please Enter a valid number for First Number", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style:.cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return false
            
            
        }
        if (secondNumber.text == "" || (secondNumber.text?.isEmpty)! || second == nil){
            
            let alert = UIAlertController(title: "Invalid Second Number", message: "Please Enter a valid number  for Second Number", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return false
            
        }
        
        return true
        
    }
    
}

