//
//  SongsForAlbumListView.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 19/07/2023.
//

import SwiftUI

struct SongsForAlbumListView: View {
    
    @ObservedObject var songsViewModel:SongsForAlbumListViewModel
    
    let selectedSong:Song?
    
    var body: some View {
        ScrollViewReader{proxy in
            ScrollView {
                if songsViewModel.state == .isLoading{
                    ProgressView()
                        .progressViewStyle(.circular)
                }else if songsViewModel.songs.count>0{ 
                    SongGridView(songs: songsViewModel.songs, selectedSong: selectedSong)
                        .onAppear{
                            print("scroll in list with \(songsViewModel.songs.count) songs")
                            proxy.scrollTo(selectedSong?.trackNumber,anchor: .center)
                }
            }
            }
            //.onReceive(songsViewModel.$songs, perform: { songs in
               //if songs.count>0{
                   // proxy.scrollTo(selectedSong?.trackNumber,anchor: .center)
                //}
            //})
        }
    }
    

}

struct SongsForAlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        SongsForAlbumListView(songsViewModel: SongsForAlbumListViewModel.example(), selectedSong: nil)
    }
}

struct SongGridView:View{
    let songs:[Song]
    let selectedSong:Song?
    var body: some View{
        Grid(horizontalSpacing: 20) {
            ForEach(songs){song in
                GridRow{
                    Text("\(song.trackNumber)")
                        .font(.footnote)
                        .gridColumnAlignment(.trailing)
                        //.frame(width:25,alignment: .trailing)
                    Text(song.trackName)
                        .gridColumnAlignment(.leading)
                    Spacer()
                    Text(formattedDuration(time:song.trackTimeMillis))
                        .font(.footnote)
                        //.frame(width:50,alignment: .center)
                    BuySongButton(urlString: song.previewURL, price: song.trackPrice, currency: song.currency)

                }
                .foregroundColor(song == selectedSong ? Color.accentColor : Color(.label))
                .id(song.trackNumber)
                Divider()

            }
        }
        .padding([.vertical,.leading])
    }
    
    func formattedDuration(time:Int)->String{
        let timeInSeconds=time / 1000
        let interval=TimeInterval(timeInSeconds)
        let formatter=DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits=[.minute,.second]
        formatter.unitsStyle = .positional
        
        return formatter.string(from: interval) ?? ""
    }
}
