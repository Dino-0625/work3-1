//
//  Editphoto.swift
//  work2
//
//  Created by tsui erh li on 2020/10/24.
//

import SwiftUI

struct Editphoto: View {
    
    @Binding var birthday : Date
    @State private var twoPicOrNot : Bool = true
    @State private var scale :CGFloat = 1
    @State private var brightnessAmount :Double = 0
    @State private var selectDate = Date()
    @State private var selectBlend = BlendMode.screen
    @Environment(\.presentationMode) var presentationMode
    @Binding var show_Tatis : Bool
    let today=Date()
    let startDate=Calendar.current.date(byAdding:.year,value:-2,to:Date())!
    
    let blendModes: [BlendMode] = [.screen, .colorDodge, .colorBurn,.lighten,.hue ,.exclusion,.saturation,.color,.luminosity,.sourceAtop,.plusDarker
        ,.plusLighter]
    var body: some View {
        VStack {
            
                GeometryReader{ geometry in
                    VStack {
                        ZStack {
                            Image("background-2").resizable().scaledToFill().scaleEffect(scale).frame(width:geometry.size.width,height:geometry.size.width/4*3).brightness(brightnessAmount).clipped()
                            if(!twoPicOrNot){Image("Tatis-2").resizable().scaledToFill().scaleEffect(scale).frame(width:geometry.size.width,height:geometry.size.width/4*3).brightness(brightnessAmount).clipped().blendMode(selectBlend)
                            }
                        }
                        Text("Choose mode").font(.system(size:40)).foregroundColor(.gray).frame(width:300,height:50).background(Color.black)
                        HStack (spacing:30){
                            Button(action:{twoPicOrNot=false;brightnessAmount = 0}){Text("blend").bold().colorInvert()
                                }.frame(width:120,height:50).background(Rectangle()).frame(width:50,height:50)
                            Spacer()
                            Button(action:{twoPicOrNot=true}){Text("opacity")}.frame(width:120,height:50).background(Rectangle())
                        }.padding().frame(width:200,height:50).offset(x:20)
                        
                        Form {
                            
                            HStack {
                                Text("亮度")
                                Brightness(brightnessAmount:$brightnessAmount)
                            }
                            HStack {
                                Text("大小")
                                Slider(value: $scale, in: 0...1).accentColor(.orange)
                            }
                            Text("\(scale, specifier: "%.2f")")
                            //DisclosureGroup("選擇blend"){
                            
                            Picker("選擇blend",selection: $selectBlend){
                                ForEach(blendModes,id:\.self){
                                            (blendMode) in
                                            Text(blendMode.name)
                                    
                                    }
                            }.pickerStyle(WheelPickerStyle())
                            //}
                            
                            
                            DatePicker("今天幾號",selection:$birthday,in:startDate...today,displayedComponents:.date)
                            Button("back to main page"){
                                show_Tatis=false
                            }
                           
                            
                        }
                        
                    }
                    
                }
            
            
        }
    }
}

struct Editphoto_Previews: PreviewProvider {
    static var previews: some View {

        Editphoto(birthday : .constant(Date()),show_Tatis :.constant(true))
    }
}

struct Brightness: View {
    @Binding var brightnessAmount :Double
    var body: some View {
        Slider(value: $brightnessAmount, in: 0...1,minimumValueLabel:Image(systemName:"sun.max.fill").imageScale(.small),maximumValueLabel:Image(systemName:"sun.max.fill").imageScale(.large)){
            Text("")
        }.accentColor(.orange)
    }
}
extension BlendMode{
    var name: String{
        "\(self)"
    }
}

//struct Editphoto_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
