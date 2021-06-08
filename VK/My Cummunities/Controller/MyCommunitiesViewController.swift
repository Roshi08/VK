//
//  MyCommunitiesViewController.swift
//  VK
//
//  Created by Екатерина on 08.06.2021.
//

import UIKit

final class MyCommunitiesViewController: UIViewController{
    
}

extension MyCommunitiesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: CommunitiesTableViewCell.identifier)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}
