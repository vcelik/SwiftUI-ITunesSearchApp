//
//  AlbumForSongViewModel.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 20/08/2023.
//

import Foundation

class AlbumForSongViewModel:ObservableObject{
    @Published var album:Album?=nil
    @Published var state: FetchState = .good
    
    let service=APIService()
    
    func fetchSong(song:Song){
        
        let albumId=song.collectionID
        state = .isLoading
        
        service.fetchAlbum(for: albumId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    print("successfully fetched album for song: \(song.trackName)")
                    self?.album=results.results.first
                case .failure(let error):
                    print("error when fetching album with id \(error)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
}
