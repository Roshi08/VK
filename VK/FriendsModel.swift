//
//  FriendsModel.swift
//  VK
//
//  Created by Екатерина on 11.06.2021.
//

import Foundation

struct FriendsModel {
    let name: String
    let FriendsImageName: String
}

struct FriendsStorage {
    static let shared = FriendsStorage()
    
    var friends: [FriendsModel]
    
    private init(){
        friends = [
        FriendsModel(name: "Dwayne Wade", FriendsImageName: "Wade"),
        FriendsModel(name: "Ben Wallace", FriendsImageName: "Wallace"),
        FriendsModel(name: "Klay Thompson", FriendsImageName: "Thompson"),
        FriendsModel(name: "Joe Harris", FriendsImageName: "Harris"),
        FriendsModel(name: "Karl Malone", FriendsImageName: "Malone"),
        ]
    }
    
}
