//
//  ViewController.swift
//  Assign1Calculator
//
//  Created by Guilherme Morais on 2017-01-15.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//

import UIKit

enum operation {
   case percent, add, minus, divide, mult, none
}

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    
    var operationTapped:Bool = false
    var currentValue:String = "0"
    var currentOperation:operation = .none
    var savedNum:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func showValue() {
        guard let labelInt:Double = Double(currentValue) else {
            return
        }
        if (currentOperation == .none) {
            savedNum = labelInt
        }
        
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let num:NSNumber = NSNumber(value: labelInt)
        mainLabel.text = formatter.string(from: num)
    }

    func changeOperation(newOperation:operation)
    {
        currentOperation = newOperation
        operationTapped = true
        
    }
    
    @IBAction func numberTap(_ sender: UIButton) {
        let stringValue:String? = sender.titleLabel?.text
        
        if (operationTapped) {
            operationTapped = false
            currentValue = "0"
        }
        
        currentValue = currentValue.appending(stringValue!)
        
        showValue()
    }
    
    @IBAction func operationTapped(_ sender: UIButton) {
         var stringOp:String? = sender.titleLabel?.text
        currentValue = mainLabel.text!
        operationTapped = true
        
        switch (stringOp!)
        {
        case "+" :
            currentOperation = operation.add
            break
        case "-" :
            currentOperation = operation.minus
            break
        case "x" :
            currentOperation = operation.mult
            break
        case "÷" :
            currentOperation = operation.divide
            break
        case "%" :
            currentOperation = operation.percent
            savedNum /= 100
            currentValue = "\(savedNum)"
            showValue()
            break
        default: break
        }

    }
    
    @IBAction func inverseSignalTapped(_ sender: UIButton) {
       if mainLabel.text?.range(of:"-") != nil {
            mainLabel.text?.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
     }
        else
        {
            mainLabel.text = "-" + mainLabel.text!
            currentValue = (mainLabel.text!)
            savedNum = Double(currentValue)!
        }
    }

    
    @IBAction func ACTapped(_ sender: UIButton) {
        currentOperation = .none
        currentValue = "0"
        mainLabel.text = "0"
        showValue()
    }
    
    
    @IBAction func periodTapped(_ sender: UIButton) {
        if mainLabel.text?.range(of:".") == nil {
            mainLabel.text = mainLabel.text! + "."
            currentValue = (mainLabel.text!)
            savedNum = Double(currentValue)!
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let labelInt:Double = Double(currentValue) else {
            return
        }

        switch (currentOperation)
        {
        case .add:
            savedNum += labelInt
            break
        case .minus:
            savedNum -= labelInt
            break
        case .mult:
            savedNum *= labelInt
            break
        case .divide:
            savedNum /= labelInt
            break
        case .percent:
            currentOperation = operation.percent
            break
        default: break
        }

        
        currentOperation = .none
        currentValue = "\(savedNum)"
        showValue()
        operationTapped = true
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

