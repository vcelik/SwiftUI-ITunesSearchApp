//
//  MovieListView.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 17/07/2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel:MovieListViewModel
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.movies){movie in
                    MovieRowView(movie: movie)
                }
                
                switch viewModel.state{
                case .good:
                    Color.yellow
                        .onAppear{
                            viewModel.loadMore()
                        }
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth:.infinity)
                case .loadedAll:
                    //EmptyView()
                    Color.gray
                case .error(let message):
                    Text(message)
                        .foregroundColor(.pink)
                }
            }

            .listStyle(.plain)
        }

    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel())
    }
}
