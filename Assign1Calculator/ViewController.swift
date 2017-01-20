//
//  ViewController.swift
//  Assign1Calculator
//
//  Created by Guilherme Morais on 2017-01-15.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//

import UIKit

enum operation {
   case percent, add, minus, mult, none
}

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    
    var operationTapped:Bool = false
    var currentValue:String = "0"
    var currentOperation:operation = .none
    var savedNum:Int = 0
    
    func showValue() {
        guard let labelInt:Int = Int(currentValue) else {
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
//        //let stringOperation:String? = sender.titleLabel?.text
//        currentValue = mainLabel.text!
//        operationTapped = true
//        
//        switch (sender.titleLabel!.text!)
//        {
//        case "+" :
//            currentOperation = operation.add
//            break
//        case "-" :
//            currentOperation = operation.minus
//            break
//        default: break
//        }

    }
    
//    @IBAction func buttonTap(_ sender: UIButton) {
//        if (sender.value(forKey: <#T##String#>))
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

