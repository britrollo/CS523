//
//  ViewController.swift
//  Calculator
//
//  Created by Brianne Trollo on 1/29/19.
//  Copyright © 2019 Brianne Trollo. All rights reserved.
//

//Brianne Trollo
//I pledge my honor that I have abided by the Stevens Honor System.

import UIKit

class ViewController: UIViewController {
    //Global variables
    var firstNumber=""
    var secondNumber=""
    var operand=""
    var result:String=""
    var resultFlag=false
    
    @IBOutlet weak var myText: UITextField!
    
    //Clear button
    @IBAction func myClr(_ sender: AnyObject) {
        myText.text=""
        result=""
        firstNumber=""
        secondNumber=""
        operand=""
        result=""
        resultFlag=false
    }
    
    //One
    @IBAction func myOne(_ sender: AnyObject) {
        if resultFlag == true {
            result=""
            resultFlag=false
        }
        if result == "" {
            myText.text="1"
            result="1"
        } else {
            result = result + "1"
            myText.text = result
        }
    }
    
    //Two
    @IBAction func myTwo(_ sender: AnyObject) {
        if resultFlag == true {
            result=""
            resultFlag=false
        }
        if result == "" {
            myText.text="2"
            result="2"
        } else {
            result = result + "2"
            myText.text = result
        }
    }
    
    //Three
    @IBAction func myThree(_ sender: AnyObject) {
        if resultFlag == true {
            result=""
            resultFlag=false
        }
        if result == "" {
            myText.text="3"
            result="3"
        } else {
            result = result + "3"
            myText.text = result
        }
    }
    
    //Four
    @IBAction func myFour(_ sender: AnyObject) {
        if resultFlag == true {
            result=""
            resultFlag=false
        }
        if result == "" {
            myText.text="4"
            result="4"
        } else {
            result = result + "4"
            myText.text = result
        }
    }
    
    //Five
    @IBAction func myFive(_ sender: AnyObject) {
        if resultFlag == true {
            result=""
            resultFlag=false
        }
        if result == "" {
            myText.text="5"
            result="5"
        } else {
            result = result + "5"
            myText.text = result
        }
    }
    
    //Six
    @IBAction func mySix(_ sender: AnyObject) {
        if resultFlag == true {
            result=""
            resultFlag=false
        }
        if result == "" {
            myText.text="6"
            result="6"
        } else {
            result = result + "6"
            myText.text = result
        }
    }
    
    //Seven
    @IBAction func mySeven(_ sender: AnyObject) {
        if resultFlag == true {
            result=""
            resultFlag=false
        }
        if result == "" {
            myText.text="7"
            result="7"
        } else {
            result = result + "7"
            myText.text = result
        }
    }
    
    //Eight
    @IBAction func myEight(_ sender: AnyObject) {
        if resultFlag == true {
            result=""
            resultFlag=false
        }
        if result == "" {
            myText.text="8"
            result="8"
        } else {
            result = result + "8"
            myText.text = result
        }
    }
    
    //Nine
    @IBAction func myNine(_ sender: AnyObject) {
        if resultFlag == true {
            result=""
            resultFlag=false
        }
        if result == "" {
            myText.text="9"
            result="9"
        } else {
            result = result + "9"
            myText.text = result
        }
    }
    
    //Zero
    @IBAction func myZero(_ sender: AnyObject) {
        if resultFlag == true {
            result=""
            resultFlag=false
        }
        if result == "" {
            myText.text="0"
            result="0"
        } else {
            result = result + "0"
            myText.text = result
        }
    }
    
    @IBAction func myEqual(_ sender: AnyObject) {
        let firstNumberInt:Double=Double(firstNumber)!
        let secondNumberInt:Double=Double(result)!
        
        var finalResult:Double=0
        if operand=="+"{
            finalResult = firstNumberInt+secondNumberInt
        }
        if operand=="-"{
            finalResult = firstNumberInt-secondNumberInt
        }
        if operand=="/"{
            finalResult = firstNumberInt/secondNumberInt
        }
        if operand=="*"{
            finalResult = firstNumberInt*secondNumberInt
        }
        if operand != "" {
            myText.text=""
            myText.text=String(finalResult)
            result=String(finalResult)
            operand=""
            resultFlag=true
        }
    }
    
    //Addition button controls
    @IBAction func myAdd(_ sender: AnyObject) {
        //new operation
        if operand==""{
            firstNumber=result
            myText.text = result + "+"
            operand="+"
            result=""
            
        }
    }
    
    //Subtraction button controls
    @IBAction func mySub(_ sender: AnyObject) {
        if operand=="" {
            firstNumber=result
            myText.text = result + "-"
            operand="-"
            result=""
        }
    }
    
    //Division button controls
    @IBAction func myDiv(_ sender: AnyObject) {
        if operand=="" {
            firstNumber=result
            myText.text = result + "/"
            operand="/"
            result=""
        }
    }
    
    //Multiplication button controls
    @IBAction func myMult(_ sender: AnyObject) {
        if operand=="" {
            firstNumber=result
            myText.text = result + "*"
            operand="*"
            result=""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

