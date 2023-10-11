//
//  ContentView.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 17/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            AlbumSearchView()
                .tabItem {
                    Label("Albums", systemImage: "music.note")
                }
            MovieSearchView()
                .tabItem {
                    Label("Movies", systemImage: "tv")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
