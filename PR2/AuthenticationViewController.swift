//
//  AuthenticationViewController.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    @IBOutlet weak var fourthField: UITextField!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // We first check that the user is only entering numeric characters
        let numericSet = CharacterSet.decimalDigits
        let stringSet = CharacterSet(charactersIn: string)
        let onlyNumeric = numericSet.isSuperset(of: stringSet)
        
        if !onlyNumeric {
            return false
        }
        
        // We then check that the length of resulting text will be smaller or equal to 1
        let currentString = textField.text as NSString?
        let resultingString = currentString?.replacingCharacters(in: range, with: string)
        
        if let resultingLength = resultingString?.count, resultingLength <= 1 {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        doAuthentication()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func doAuthentication() {
        var validCode: Bool
        if let firstCode = firstField.text, let secondCode = secondField.text, let thirdCode = thirdField.text, let fourthCode = fourthField.text {
            let fullCode = firstCode + secondCode + thirdCode + fourthCode
            validCode = Services.validate(code: fullCode)
        } else {
            validCode = false
        }
        
        if validCode {
            // BEGIN-UOC-2
            print("antes")
            
            animateTransitions()
            //performSegue (withIdentifier: "SegueToMainNavigation", sender: self)
            print("despues")
            // END-UOC-2
        } else {
            let errorMessage = "Sorry, the entered code is not valid"
            let errorTitle = "We could not autenticate you"
            Utils.show (Message: errorMessage, WithTitle: errorTitle, InViewController: self)
        }
    }
    // codigo para apartado 2
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)    // Set the label's initial alpha
        firstField.alpha = 1
        secondField.alpha = 1
        thirdField.alpha = 1
        fourthField.alpha = 1
        
        firstLabel.alpha=1
        secondLabel.alpha=1
        thirdLabel.alpha=1
        fourthLabel.alpha=1
    }
    func animateTransitions() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.5,
            options: [],
            animations: {
                self.firstField.alpha = 0
                self.secondField.alpha = 0
                self.thirdField.alpha = 0
                self.fourthField.alpha = 0
                
                self.firstLabel.alpha=0
                self.secondLabel.alpha=0
                self.thirdLabel.alpha=0
                self.fourthLabel.alpha=0
            },
            completion: { _ in
                print("se ha terminado la primera animaciion")
                self.performSegue (withIdentifier: "SegueToMainNavigation", sender: self)

                
            }
        )
        
    }
    
    // fin código para apartado 2
    
    // BEGIN-UOC-1
    
    @IBAction func firstFieldChanged(_ sender: UITextField) {
        print("pasar para el siguiente")
        secondField.becomeFirstResponder() // control activo
    }
    
    @IBAction func secondFieldChanged(_ sender: UITextField) {
        thirdField.becomeFirstResponder()
    }
    @IBAction func thirtFieldChanged(_ sender: UITextField) {
        fourthField.becomeFirstResponder()
    }
    @IBAction func fourthFieldChanged(_ sender: UITextField) {
        doAuthentication()
    }
    // END-UOC-1
}
