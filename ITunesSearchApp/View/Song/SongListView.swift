//
//  SongListView.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 17/07/2023.
//

import SwiftUI

struct SongListView: View {
    @ObservedObject var viewModel:SongListViewModel
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.songs){song in
                    NavigationLink {
                        SongDetailView(song: song)
                    } label: {
                        SongRowView(song: song)
                    }
                    .buttonStyle(.plain)


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

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(viewModel: SongListViewModel.example())
    }
}


