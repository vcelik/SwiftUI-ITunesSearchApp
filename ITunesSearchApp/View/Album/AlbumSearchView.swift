//
//  AlbumSearchView.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 17/07/2023.
//

import SwiftUI

struct AlbumSearchView: View {
    @StateObject var viewModel=AlbumListViewModel()
    
    var body: some View {
        NavigationView{
            Group{
                if viewModel.searchTerm.isEmpty{
                    SearchPlaceholderView(searchTerm: $viewModel.searchTerm)
                }else{
                    AlbumListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Albums")
        }

    }
}



struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}
