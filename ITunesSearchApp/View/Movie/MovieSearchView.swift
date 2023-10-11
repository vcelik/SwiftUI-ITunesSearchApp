//
//  MovieListView.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 17/07/2023.
//

import SwiftUI

struct MovieSearchView: View {
    @StateObject var viewModel=MovieListViewModel()
    
    var body: some View {
        NavigationView{
            Group{
                MovieListView(viewModel: viewModel)
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Movies")
        }

    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
