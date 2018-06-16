//
//  ViewController.swift
//  EuroChequeWriter
//
//  Created by Henrik Gustavii on 21/03/2017.
//  Copyright © 2017 aecasorg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var conversionOutput: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.conversionOutput.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func englishButton(_ sender: UIButton) {
        let englishNumber = EnglishCheque()
        if let input = self.numberInput.text, let numberInputDouble:Double = Double(input) {
            if numberInputDouble < 100000000 {
                print("\(englishNumber.checkNumber(number: numberInputDouble))")
                self.conversionOutput.text = "\(englishNumber.checkNumber(number: numberInputDouble))"
                self.conversionOutput.isHidden = false
            } else {
                self.showAlert(title: "Too large amount!", message: "Amount needs to be lower than 100 million")
            }
        } else {
            self.showAlert(title: "Something is missing...", message: "Please enter a number!")
        }
    }
    
     @IBAction func frenchButton(_ sender: UIButton) {
        let frenchNumber = FrenchCheque()
        if let input = self.numberInput.text, let numberInputDouble:Double = Double(input) {
            if numberInputDouble < 100000000 {
                print("\(frenchNumber.checkNumber(number: numberInputDouble))")
                self.conversionOutput.text = "\(frenchNumber.checkNumber(number: numberInputDouble))"
                self.conversionOutput.isHidden = false
            } else {
                self.showAlert(title: "Too large amount!", message: "Amount needs to be lower than 100 million")
            }
        } else {
            self.showAlert(title: "Something is missing...", message: "Please enter a number!")
        }
    }
    
     @IBAction func spanishButton(_ sender: UIButton) {
        let spanishNumber = SpanishCheque()
        if let input = self.numberInput.text, let numberInputDouble:Double = Double(input) {
            if numberInputDouble < 100000000 {
                print("\(spanishNumber.checkNumber(number: numberInputDouble))")
                self.conversionOutput.text = "\(spanishNumber.checkNumber(number: numberInputDouble))"
                self.conversionOutput.isHidden = false
            } else {
                self.showAlert(title: "Too large amount!", message: "Amount needs to be lower than 100 million")
            }
        } else {
            self.showAlert(title: "Something is missing...", message: "Please enter a number!")
        }
    }
    
     @IBAction func germanButton(_ sender: UIButton) {
        let germanNumber = GermanCheque()
        if let input = self.numberInput.text, let numberInputDouble:Double = Double(input) {
            if numberInputDouble < 100000000 {
                print("\(germanNumber.checkNumber(number: numberInputDouble))")
                self.conversionOutput.text = "\(germanNumber.checkNumber(number: numberInputDouble))"
                self.conversionOutput.isHidden = false
            } else {
                self.showAlert(title: "Too large amount!", message: "Amount needs to be lower than 100 million")
            }
        } else {
            self.showAlert(title: "Something is missing...", message: "Please enter a number!")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }


}

