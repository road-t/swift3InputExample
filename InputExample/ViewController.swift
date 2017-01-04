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
    
    override func viewDidLoad()
    {
        // создаем кнопку
        let button = UIButton()
    
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
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
    
    func pushButton(sender: UIButton!)
    {
        // переход к другому вью посредством storyboard
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        // устанавливаем переменную класса вызываемой вьюхе - по-друому значение ей не передать
        nextVC.inputValue = self.inputTF.text!
        
        // отображаем
        self.present(nextVC, animated: true, completion: nil)
    }
}

