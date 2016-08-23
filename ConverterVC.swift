//  ConverterVC.swift
//  Created by Nekokoatl on 18/06/16.


import UIKit

class ConverterVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var celsiusLbl: UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBAction func farenheitFieldChanged (textfield: UITextField){
        if let text =  textfield.text, value = Double(text) {
            farenheitValue = value
        } else {
            farenheitValue = nil
        }
    }
    
    @IBAction func dissmissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    var farenheitValue: Double? {
        didSet {
        updateCelsiusLbl()
        }
    }
    
    var celsiusValue: Double? {
        if let value = farenheitValue {
            return (value - 32) * (5/9)
        } else {return nil}
    }
    
    var image = UIImage(named: "pattern55.jpg")

    
    let numberFormatter: NSNumberFormatter = {
    let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        toggleImg()
        self.view.backgroundColor = UIColor(patternImage: image!)
    }
    
    func toggleImg(){
        if image == UIImage(named: "ac29.jpg") {
             image = UIImage(named: "ac13.jpg")
        } else {  image = UIImage(named: "ac29.jpg")}

        }

    
    func updateCelsiusLbl(){
         if let value = celsiusValue {
            celsiusLbl.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLbl.text = "???"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range:NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")

         if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true }
    }
}
