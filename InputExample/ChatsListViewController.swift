//
//  SecondViewController.swift
//  InputExample
//
//  Created by RT on 04.01.17.
//
//

import UIKit

// грубый массив чатов в виде кортежей
var chatData = [(id: 100, title: "Chat 1", lastMessage: "Message blah-blah-blah", lastTime: "01.05.17 17:08"),
                (id: 5, title: "Chat 2", lastMessage: "Message2 blah2-blah2-blah", lastTime: "01.05.17 16:30"),
                (id: 3, title: "Chat 3", lastMessage: "Message3 blah-blah-blah3", lastTime: "01.05.17 16:41"),
                (id: 888, title: "Chat X", lastMessage: "Lorem ipsum dolor sit amet", lastTime: "01.05.17 17:54")
]

class ChatsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var table: UITableView!
    var login = "";
    var password = "";
    
    @IBOutlet weak var label: UILabel! // Label для простоты создан в IB
    
    override func viewDidLoad()
    {
        table.delegate = self
        table.dataSource = self
    }
    
    @IBAction func goBack(_ sender: Any)
    {
        // закрываем вью
        self.dismiss(animated: true, completion: nil)
    }
    
    // количество секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    // количество строк в секции (т.к. секция одна, параметр section не используется)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return chatData.count
    }
    
    // эта функция рендерит конкретную ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // берем ячейку нужного класса
        let cell = table.dequeueReusableCell(withIdentifier: "chatCell") as! ChatCell
        
        // прописываем свойства ее элементам
        cell.title.text = chatData[indexPath.item].title
        cell.lastMessage.text = chatData[indexPath.item].lastMessage
        cell.lastTime.text = chatData[indexPath.item].lastTime
    
        // при каждой отрисовке ячейки устанавливается рандомный цвет
        cell.backgroundColor = randomColor()
        
        // возвращаем
        return cell
    }
    
    func randomColor() -> UIColor{
        
        let red: CGFloat = CGFloat(drand48())
        let green: CGFloat = CGFloat(drand48())
        let blue: CGFloat = CGFloat(drand48())
        let alpha: CGFloat = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toChatSegue"
        {
            let chatController = segue.destination as? ChatViewController
            if let indexPath = self.table.indexPathForSelectedRow
            {
                chatController?.chatId = chatData[indexPath.item].id
            }
        }
    }
}
