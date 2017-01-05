//
//  ChatCell.swift
//  InputExample
//
//  Created by RT on 05.01.17.
//
//

import UIKit

class ChatCell: UITableViewCell
{
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var lastTime: UILabel!
    
    override func didMoveToSuperview()
    {
    }
}
