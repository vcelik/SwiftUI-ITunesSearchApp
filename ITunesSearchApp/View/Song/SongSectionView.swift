//
//  SongSectionView.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 18/07/2023.
//

import SwiftUI

struct SongSectionView: View {
    let songs:[Song]
    let rows=Array(repeating: GridItem(.fixed(60),spacing:0,alignment: .leading), count: 4)
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: rows,spacing:15) {
                ForEach(songs){song in
                    NavigationLink {
                        SongDetailView(song: song)
                    } label: {
                        SongRowView(song: song)
                            .frame(width:300)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SongSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SongSectionView(songs: [Song.example()])
    }
}
