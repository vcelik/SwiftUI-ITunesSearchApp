//
//  MovieListViewModel.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 17/07/2023.
//

import Foundation
import Combine

class MovieListViewModel:ObservableObject{
    @Published var searchTerm: String = ""
    @Published var movies:[Movie]=[Movie]()
    @Published var state:FetchState = .good
    
    private let service=APIService()

    var subscriptions = Set<AnyCancellable>()
    
    init() {

        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.state = .good
                self?.movies = []
                self?.fetchMovies(for: term)
            }.store(in: &subscriptions)
    }
    
    func fetchMovies(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else {
            return
        }
        
        state = .isLoading
        
        service.fetchMovies(searchTerm: searchTerm) { [weak self] result in
            DispatchQueue.main.async {
                switch result{
                case .success(let results):
                    self?.movies=results.results
                    self?.state = .good 
                    print("fetched movies \(results.resultCount)")
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
        
        
    }
    
    func loadMore() {
        fetchMovies(for: searchTerm)
    }
    
    static func example() -> MovieListViewModel {
        let vm = MovieListViewModel()
        vm.movies = [Movie.example()]
        return vm
    }
    

}
