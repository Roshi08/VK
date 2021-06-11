//
//  CommunitiesTableViewCell.swift
//  VK
//
//  Created by Екатерина on 08.06.2021.
//

import UIKit

final class CommunitiesTableViewCell{
    
    static let identifier = "CommunitiesTableViewCell"
    
    @IBOutlet private weak var friendsImageView: UIImageView!
    @IBOutlet private weak var friendNameLabel: UILabel!
    @IBOutlet private weak var teamLabel: UILabel!
   
    func configure(_ friend: FriendsModel){
        friendsImageView.image = UIImage(named: "Harris")
        friendNameLabel.text = friend.name
    }
}
