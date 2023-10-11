//
//  EntityType.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 17/07/2023.
//

import Foundation

enum EntityType: String,Identifiable,CaseIterable {
    case all
    case album
    case song
    case movie
    
    var id:String{
        return self.rawValue
    }
    
    func name()->String{
        switch self {
        case .all:
            return "All"
        case .album:
            return "Albums"
        case .song:
            return "Songs"
        case .movie:
            return "Movies"
        }
    }
}
