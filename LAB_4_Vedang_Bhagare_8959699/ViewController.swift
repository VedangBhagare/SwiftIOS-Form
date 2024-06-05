//
//  ViewController.swift
//  LAB_4_Vedang_Bhagare_8959699
//
//  Created by Hardik Paranjape on 2024-06-02.
//
//Reference taken from Stack Overflow, Chat GPT

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   //Making connections
    @IBOutlet weak var firstName: UITextField!         //connecting First Name text field
    
    @IBOutlet weak var surname: UITextField!           //connecting Surname text field
    
    @IBOutlet weak var address: UITextField!           //connecting Address text field
    
    @IBOutlet weak var city: UITextField!              //connecting City text field
    
    @IBOutlet weak var dateOfBirth: UIDatePicker!      //connecting Date of birth text field
    
    @IBOutlet weak var displayText: UITextView!
    
    //function to calculate age from date of birth as input
    func calculateAge(from dateOfBirth: Date)-> Int{
        let calendar = Calendar.current
        //Fetch year from date of birth and calculates age
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
        return ageComponents.year!
    }
    
    //reset button to reset all input fields
    @IBAction func resetButton(_ sender: UIButton) {
        firstName.text = ""
        surname.text = ""
        address.text = ""
        city.text = ""
        dateOfBirth.date = Date()
        displayText.text = ""
    }
    
    //accept button that accepts user input, also checks condition if its not empty
    @IBAction func acceptButton(_ sender: UIButton) {
        guard let firstNameText = firstName.text, !firstNameText.isEmpty,
              let surnameText = surname.text, !surnameText.isEmpty,
              let addressText = address.text, !addressText.isEmpty,
              let cityText = city.text, !cityText.isEmpty
                //else loop to return error message to fill all input fields
        else {
            Alert(with: "Error", message: "Please fill all fields !!")
            return
        }
        
        let dateOfBirthText = dateOfBirth.date
        let ageText = calculateAge(from: dateOfBirthText)
        
        guard ageText >= 18
                //error to catch if age is less than 18
        else {
            Alert(with: "Error", message: "Age must be at least 18")
            return
        }
        
        
        // Form submitted successfully prompt
        Alert(with: "Congratulations !!", message: "Your Form is submitted successfully.")
        displayText.text = """
"I,\(firstNameText), \(surnameText), currently living at \(addressText) in the city of \(cityText) do hereby accept the terms and conditions of assignment
I am \(ageText) and therefore am able to accept the conditions of this assignment.
"""

               
    }
    
    //Decline button function
    @IBAction func declineButton(_ sender: UIButton) {
        firstName.text = ""
        surname.text = ""
        address.text = ""
        city.text = ""
        dateOfBirth.date = Date()
        
        Alert(with: "Decline", message: "Your request has been declined.")
    }
    
    //Alert function to print alert prompt messages
    func Alert(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

