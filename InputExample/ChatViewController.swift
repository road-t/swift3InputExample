//
//  ChatViewController.swift
//  InputExample
//
//  Created by RT on 06.01.17.
//
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var messagesTable: UITableView!
    @IBOutlet weak var messageField: UITextView!
    
    var chatId: Int = 0
    
    override func viewDidLoad()
    {
        print("chat #\(chatId) opened")
    }
    
    @IBAction func sendAction(_ sender: Any)
    {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = messagesTable.dequeueReusableCell(withIdentifier: "messageCell") as! MessageCell
        
        return cell
    }
}
