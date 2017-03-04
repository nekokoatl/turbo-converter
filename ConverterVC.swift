//  ConverterVC.swift
//  Created by Nekokoatl on 18/06/16.


import UIKit

class ConverterVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var celsiusLbl: UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBAction func farenheitFieldChanged (_ textfield: UITextField){
        if let text =  textfield.text, let value = Double(text) {
            farenheitValue = value
        } else {
            farenheitValue = nil
        }
    }
    
    @IBAction func dissmissKeyboard(_ sender: AnyObject){
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

    
    let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    

    
    override func viewWillAppear(_ animated: Bool) {
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
            celsiusLbl.text = numberFormatter.string(from: (value as NSNumber))
        } else {
            celsiusLbl.text = "???"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")

         if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true }
    }
}
