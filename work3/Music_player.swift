//
//  Music_player.swift
//  work2
//
//  Created by User03 on 2020/10/28.
//
import AVFoundation
import SwiftUI
struct music{
    let name : String
    @State public var play : Bool = false
    
}
struct Music_player:
    View {
    @State private var age : Float = 1
    @State private var degrees: Double = 0
    @State var music_name : String = ""
    @State var  gg : Int = 0
    @State var nowPlayering : String = ""
    //var nowPlayering : Int = 0
    @Binding var show_Music_player: Bool
    @State private var isPlay = false
    let player = [music(name : "Eason"),music(name :"無名之輩"),music(name :"怎樣"),music(name :"與我無關"),music(name :"稻香"),music(name :"街角的祝福"),music(name :"One_day")]
    let playerrr = AVPlayer()
    
   
    var body: some View {
        VStack {
            Image("p").resizable().scaledToFill().frame(minWidth:0,maxWidth:.infinity).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    List{
                        ForEach(player.indices){
                            (item)in
                            Button("\(player[item].name)"){
                                isPlay=false
                                player[item].play=true
                                nowPlayering = player[item].name
                            }.foregroundColor(.green).foregroundColor(.yellow)
                           
                        }
                    }
                }
                //Stepper("Enter your Vulume", value: $age, in: 0...1)
                
                VStack {
                    HStack {
                        Stepper("聲音大小", value: $age, in: 0...100,step : 5)
                        Text("音量 ：\(age, specifier: "%.f")")
                        Button(action:{playerrr.volume=age/100}){
                            Text("OK")
                        }
                    }
                    HStack {
                        if(isPlay){
                            Button(action:{playerrr.pause();isPlay=false}){
                                Image(systemName:"pause")
                            }
                            
                        Image(systemName:"play.fill").rotationEffect(.degrees(degrees))
                            .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                        }
                        else{
                            Image(systemName:"play")
                        }
                        
                        let str = "目前播放:"+"\(nowPlayering)"
                        Toggle(str, isOn: $isPlay)
                                        .onChange(of: isPlay, perform: { value in
                                            
                                            if value {
                                                gg=1
                                                self.degrees = 360
                                                let fileUrl = Bundle.main.url(forResource: nowPlayering, withExtension: "mp3")!
                                                let playerItem = AVPlayerItem(url: fileUrl)
                                                playerrr.replaceCurrentItem(with: playerItem)
                                                playerrr.play()
                                                playerrr.volume = self.age
                                                //player[nowPlayering].vv.play()
                                            } else {
                                                self.degrees = 0
                                                gg=0
                                                playerrr.pause()
                                            }
                                    })
                    }.padding()
                    Button("close"){
                        show_Music_player = false
                    }
                    
                }
               
                
                
                
                
            }
            
        }
    }
}

struct Music_player_Previews: PreviewProvider {
    static var previews: some View {
        Music_player(show_Music_player: .constant(true))
    }
}
