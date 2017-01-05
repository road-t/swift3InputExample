//
//  SecondViewController.swift
//  InputExample
//
//  Created by RT on 04.01.17.
//
//

import UIKit

class SecondViewController: UIViewController
{
    var login = "";
    var password = "";
    
    @IBOutlet weak var label: UILabel! // Label для простоты создан в IB
    
    override func viewDidLoad()
    {
        // просто устанавливаем текст, равный переданной переменной
        self.label.text = "Logged in with phone number of \(login)\nidentified by '\(password)'"
    }
    
    @IBAction func goBack(_ sender: Any)
    {
        // закрываем вью
        self.dismiss(animated: true, completion: nil)
    }
}
