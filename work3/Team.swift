//
//  Team.swift
//  work2
//
//  Created by tsui erh li on 2020/10/24.
//

import SwiftUI
struct dataAndTeam{
    var week:String
    var team:String
    var date:Int
    var wOl:String
}
struct dateAndTeam : View{
    var data: dataAndTeam
    
    var body :some View{
        ZStack {
            Color.gray.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack{
                HStack {
                    Text(data.week)
                    Text("\(data.date)")
                    
                }
                Text("@"+data.team).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(data.wOl).fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
            }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).accentColor(.gray).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }
}
struct dateAndTeam_previews: PreviewProvider {
    static var previews: some View {
        dateAndTeam(data : dataAndTeam(week: "wed", team: "ykk", date: 23, wOl: "w"))
    }
}
struct Player{
    let name:String
    let pic:String
    let introduce:String
    let url:String
}
struct Team: View {
    @State private var second_view = false
    @State private var age : Int = 0
    @State public var birthday = Date()
    @State private var name : String = ""
    @State private var selectDate = Date()
    @State private var isPresented = false
    @State private var showAlert = false
    @State private var show_Tatis = false
    @State private var show_Music_player = false
    let dataAndTeams = [dataAndTeam(week:"Wed",team:"TB",date:23,wOl:"L"),
                        dataAndTeam(week:"Fri",team:"TB",date:24,wOl:"W"),
                        dataAndTeam(week:"Sat",team:"TB",date:25,wOl:"L"),
                        dataAndTeam(week:"Sun",team:"TB",date:26,wOl:"L")]
    @State private var bgColor = Color.white
    var year:Int{
        Calendar.current.component(.year,from:birthday)
    }
    var month:Int{
        Calendar.current.component(.month,from:birthday)
    }
    var day:Int{
        Calendar.current.component(.day,from:birthday)
    }
    var team = ["紅襪","洋基","藍鳥","金鶯"]
    var y_O:String="fff"
    var pitcher = ["Nakata","Ohtani","Schezer","Cole","Urias","Kershaw"]
    var player = ["Betts","Profar","Bellinger","Tatis","Marchado","Gonzalez","Cronneworth"]
    var playerr = [Player(name:"Ohtani",pic:"ohtani",introduce:"大谷是2012年選秀中火腿隊的第一指名。從2013年到2017年，他在火腿隊擔任投手和外野手。大谷於2016年投出了日職最快球速紀錄的165km/h快速球，這也是當前日籍投手的最快球速紀錄。2017年球季過後，大谷透過入札制度與大聯盟的天使隊簽約。他在2018年球季獲得了美國聯盟年度新人王。",url:"https://www.youtube.com/watch?v=5ZWn8ynqaCQ"),
                   Player(name:"Bellinger",pic:"bellinger",introduce:"Cody James Bellinger (born July 13, 1995) is an American professional baseball first baseman and outfielder for the Los Angeles Dodgers of Major League Baseball (MLB). Bellinger was drafted by the Dodgers in the fourth round of the 2013 Major League Baseball draft, and made his MLB debut in 2017. He was named an All-Star and the National League's Rookie of the Year in 2017, and won the National League Most Valuable Player Award in 2019. Bellinger is the son of Clay Bellinger, who also played in MLB.",url:"https://www.youtube.com/watch?v=e9gCa8Vf_z8"),
                   Player(name:"machado",pic:"machado",introduce:"Manuel Arturo Machado，1992年7月6日－）出生在美國佛羅里達州邁阿密，為美國多明尼加裔職業棒球選手，目前效力於美國職棒大聯盟聖地牙哥教士隊，守備位置為三壘手及游擊手。",url:"https://www.youtube.com/watch?v=evTbm8X8gX0"),
                   Player(name:"profar",pic:"profar",introduce:"he is .....",url:""),
                   Player(name:"Tatis",pic:"Tatis",introduce:"At the beginning of 2019, Tatís was ranked as one of the top three prospects in baseball by MLB Pipeline, ESPN, Baseball America, and Baseball Prospectus.On March 26, 2019, the Padres announced that Tatís made their Opening Day roster In his major league debut, he recorded two hits.On April 1, 2019, Tatís hit his first major league home run.He finished the season hitting .317/.379/.590 with 22 home runs, 61 runs, and 106 hits over 84 games",url:"https://www.youtube.com/watch?v=22D4f3w1sx8"),
                   Player(name:"Trout",pic:"trout",introduce:"楚勞特在2009年美國職棒大聯盟選秀會中，以第一輪第25順位被洛杉磯安那罕天使選中。 他從新人聯盟的亞利桑那天使開始職棒生涯，39場比賽187打席留下 .360/.418/.506的打擊三圍與1支全壘打、25打點與13次盜壘的成績。他後來升上1A的 洋杉激流麥子隊，5場比賽20打席的打擊成績 .267/.421/.267 ",url:"https://www.youtube.com/watch?v=uR6c2RwBeqw")
    ]
    var body: some View {
        
        
        
          
          
                VStack {
                    
                    ScrollView(.horizontal){
                        HStack {
                            ForEach(dataAndTeams.indices){(index) in                      dateAndTeam(data:dataAndTeams[index])
                            }
                            Button(action :{showAlert=true}){
                                Text("今天有比賽嗎")
                            }.alert(isPresented: $showAlert) { () -> Alert in
                                let answer = ["有", "沒有"].randomElement()!
                                let temp = Int.random(in: 0...3)
                                let vsTeam = answer == "有" ? "對上\(team[temp])" : "無"
                                return Alert(title: Text(answer),message:Text(vsTeam),dismissButton:.cancel())
                             }
                        }
                    }.frame(width:.infinity)
                    
                    Text("wrold Series 3 LAD lead 2-1").multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    
                        HStack(spacing:40){
                            NavigationLink(destination:Editphoto(birthday : self.$birthday ,show_Tatis : self.$show_Tatis)){
                                Text("Wrap")
                                    .font(.body)
                                    .foregroundColor(.blue)}
                            NavigationLink(destination:Editphoto(birthday : self.$birthday ,show_Tatis : self.$show_Tatis)){
                                Text("Box")
                                    .font(.body).foregroundColor(.blue)}
                            NavigationLink(destination:Editphoto(birthday : self.$birthday ,show_Tatis : self.$show_Tatis)){
                                Text("Summary")
                                    .font(.body).foregroundColor(.blue)}
                            NavigationLink(destination:Editphoto(birthday : self.$birthday ,show_Tatis : self.$show_Tatis)){
                                Text("Videos")
                                    .font(.body).foregroundColor(.blue)}
                            
                            
                        }.frame(width:400,height:20)
                    
                    HStack(spacing:150){
                        Text("Top Stories").bold()
                        Button("see Music"){
                            show_Music_player=true
                        }.sheet(isPresented:$show_Music_player){
                            Music_player(show_Music_player: self.$show_Music_player)
                        
                        }
        //
                    }
                    ZStack {
                      
                        ScrollView(.horizontal){
                            
                            
                                HStack(spacing:10){
                                    
                                    ForEach(0..<6){
                                            (index) in
                                            //let temp = index
                                        Button(action:{second_view=true}){
                                            VStack(){
                                                Image(playerr[index].pic).resizable().scaledToFit()
                                                
                                            }
                                        }.sheet(isPresented: $second_view) {
                                            Intro_player(players : playerr.randomElement()!)
                                        }
                                    }
                                    
                                }
                            
                            
                        }.frame(width:.infinity,height:100)
                    }
                    List{
                        DisclosureGroup("先發野手"){
                            
                            VStack(alignment: .leading) {
                                ForEach(player.indices) { (index) in
                                    Text(player[index])
                                }
                            }
                        }
                        DisclosureGroup("先發投手"){
                            
                            VStack(alignment: .leading) {
                                ForEach(pitcher.indices) { (index) in
                                    Text(pitcher[index])
                                }
                            }
                            
                        }
                    }.frame(height:100)
                    .padding()
                    VStack {
                        TextField("總教練輸入姓名", text: $name)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                        
                        HStack {
                            Text("目前日期："+"\(year) "+"\(month) "+"\(day)")
                            Spacer()
                            Text("總教練:"+"\(name)")
                            
                        }
                        
                    }
                    
                    Button("change view"){

                            show_Tatis=true
                    }.sheet(isPresented:$show_Tatis){
                        Editphoto(birthday : self.$birthday ,show_Tatis : self.$show_Tatis);
                    }
                    
                    ColorPicker("Background Color",selection:$bgColor)
                        .frame(maxWidth:.infinity,maxHeight:.infinity).background(bgColor);
                }.background(bgColor)
            }//移整個版面，因為倍navigation移動到了
            //.navigationTitle("MLB").background(Rectangle()).accentColor(.blue)
            
        
        
    }
    

struct Team_Previews: PreviewProvider {
    static var previews: some View {
        Team()
    }
}
