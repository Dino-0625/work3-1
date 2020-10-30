//
//  Intro_player.swift
//  work2
//
//  Created by tsui erh li on 2020/10/24.
//

import SwiftUI


struct Intro_player: View{
    let players:Player
    var body :some View{
        VStack{
                Text(players.name)
                .font(.largeTitle)
                .fontWeight(.heavy)
                    .multilineTextAlignment(.center).foregroundColor(Color.black)

            Image(players.pic).resizable().scaledToFit()
                .clipped()
            VStack (alignment:.leading){
                ScrollView(.vertical) {
                    Text(players.introduce)
                        .font(.body)
                        .foregroundColor(Color.black)
                        .background(RoundedRectangle(cornerRadius: 0.5)).foregroundColor(Color.gray)
                }
                    //.multilineTextAlignment(.center)
                Link(destination: URL(string:players.url)!) {
                    Image("mlb").resizable().scaledToFill().frame(width:140,height:100).cornerRadius(30)
                        .shadow(radius:10)
                }
                
            }
            Spacer()
            
        }
    }
}
struct Intro_player_Previews: PreviewProvider {
    static var previews: some View {
        Intro_player(players : Player(name:"ohtani",pic:"ohtani",introduce:"non111111111111111111111on111111111111111111111111on111111111111111111111111on111111111111111111111111on111111111111111111111111on111111111111111111111111111",url:""))
    }
}

