//
//  ViewController.swift
//  InputExample
//
//  Created by RT on 04.01.17.
//
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // кнопка будет создана при первом обращении к переменной
    lazy var button: UIButton! = UIButton()
    
    lazy var login = String()
    lazy var password = String()
    
    override func viewDidLoad()
    {
        self.button.backgroundColor = UIColor.blue
        self.button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        // цвет и текст заголовока устанавливается через сеттеры
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.setTitle("push me!", for: .normal)
        
        // это нужно для правильной работы auto-layout:
        // не использовать constraints, создающихся по умолчанию при добавлении view
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // добавляем action к кнопке на тап
        button.addTarget(self, action: #selector(self.pushButton(sender:)), for: .touchUpInside)
    
        // добавляем кнопку в наш вью
        self.view.addSubview(button)
        
        // а теперь нужно установить constraints - раньше нельзя
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true // высота
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true // ширина
        
        // верхняя граница на 40 пикселов ниже нижней границы инпута
        button.topAnchor.constraint(equalTo: self.inputTF.bottomAnchor, constant: 40).isActive = true
        // отцентрируем по горизонтали относительно вью
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    // функция вызывается непосредственно перед рендерингом вью
    override func viewWillAppear(_ animated: Bool)
    {
        // прячем кнопку логина, показываем первую
        loginButton.isHidden = true
        button.isHidden = false
        
        // пытаемся загрузить номер телефона, если он был сохранен ранее
        let stored = UserDefaults()
        
        if let phoneNumber = stored.object(forKey: "phoneNumber")
        {
            self.inputTF.text = phoneNumber as? String
        }
        else
        {
            inputTF.text = ""
        }
    }
    
    func pushButton(sender: UIButton!)
    {
        self.login = inputTF.text!
        inputTF.text = ""
        loginButton.isHidden = false
        button.isHidden = true
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
    {
        if identifier == "toChatsListSegue"
        {
            self.password = inputTF.text!
            
            // сохраняем номер телефона
            let stored = UserDefaults()
            stored.setValue(self.login, forKey: "phoneNumber")
            
            return true
        }
        
        return false
    }
}

