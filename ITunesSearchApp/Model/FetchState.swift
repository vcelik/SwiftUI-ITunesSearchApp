//
//  FetchState.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 17/07/2023.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
