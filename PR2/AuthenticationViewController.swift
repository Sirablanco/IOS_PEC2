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
    
    @IBOutlet weak var pleaseLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var backConstraintLeading: NSLayoutConstraint!
    @IBOutlet weak var nextConstrainttrailingMargin: NSLayoutConstraint!
    @IBOutlet weak var pleaseConstraintPlease: NSLayoutConstraint!
    
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
            animateTransitions()
            //performSegue (withIdentifier: "SegueToMainNavigation", sender: self)
            // END-UOC-2
        } else {
            let errorMessage = "Sorry, the entered code is not valid"
            let errorTitle = "We could not autenticate you"
            Utils.show (Message: errorMessage, WithTitle: errorTitle, InViewController: self)
        }
    }
    // Código para apartado 2
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
        
        //let subir = self.pleaseConstraintPlease.constant
        /*let screenWidth = self.view.frame.width
        let screenHeigth = self.view.frame.height
        
        self.nextConstrainttrailingMargin.constant -= screenWidth
        self.backConstraintLeading.constant += screenWidth
        self.pleaseConstraintPlease.constant += screenHeigth */
        
        print("valores iniciales:")
        print (self.nextConstrainttrailingMargin.constant)
        print(self.backConstraintLeading.constant)
        print(self.pleaseConstraintPlease.constant)
        
    }
    func animateTransitions() {
        //let labelStackView = UIStackView(arrangedSubviews: [self.firstLabel,self.secondLabel,self.thirdLabel,self.fourthLabel])
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
                
               // labelStackView.alpha = 0
                
                
            },
            completion: { _ in
                // ini segundo grupo de animations
                UIView.animate(
                    withDuration: 1,
                    delay: 1,
                    options: [],
                    animations: {
                        /*
                        self.pleaseLabel.transform = self.pleaseLabel.transform.translatedBy(x: 0, y: -250)
                        self.nextButton.transform = self.nextButton.transform.translatedBy(x: +200, y:0)
                        self.backButton.transform = self.backButton.transform.translatedBy(x: -200, y: 0)
                        
                        self.pleaseLabel.alpha = 0
                        self.nextButton.alpha = 0
                        self.backButton.alpha = 0
                       */
                        print("valores de las constraints:")
                        print(self.backConstraintLeading.constant)
                        print(self.nextConstrainttrailingMargin.constant)
                        print(self.pleaseConstraintPlease.constant)
                        
                        //let subir = self.pleaseConstraintPlease.constant
                        let screenWidth = self.view.frame.width
                        let screenHeigth = self.view.frame.height
                        
                        self.nextConstrainttrailingMargin.constant += screenWidth
                        self.backConstraintLeading.constant -= screenWidth
                        self.pleaseConstraintPlease.constant -= screenHeigth
                        
                        
                    },
                    completion: { _ in
                        print("se han finalizado todas, las vuelvo a su sitio")
                        
                        // End of animation
                       //self.performSegue (withIdentifier: "SegueToMainNavigation", sender: self)
                        /*let screenWidth = self.view.frame.width
                        let screenHeigth = self.view.frame.height
                        self.nextConstrainttrailingMargin.constant -= screenWidth
                        self.backConstraintLeading.constant += screenWidth
                        self.pleaseConstraintPlease.constant += screenHeigth
                        */
                        print ("se han recuperado")
                    }
                )
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
