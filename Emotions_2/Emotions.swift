//
//  Emotions.swift
//  Emotions
//
//  Created by 村上開斗 on 2021/03/03.
//

import SwiftUI

struct Emotions: View {
    @EnvironmentObject private var emotion : environmentObject
    var body: some View {
        ZStack{
            Color(red: 0.964, green: 0.800, blue: 0.560)
                .ignoresSafeArea(.all)
            HStack{
                Button(action: {emotion.TextEditorToggle()}) {
                    VStack{
                        Image("fun")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("fun")
                    }
                }
                VStack{
                Image("happy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("happy")
                }
                VStack{
                Image("normal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("normal")
                }
                VStack{
                Image("tired")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("tired")
                }
                VStack{
                Image("kill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("kill")
                }
            }
            if emotion.TextEditor == true {
                Texteditor()
                    .edgesIgnoringSafeArea(.all)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
            }
        }
    }
}
    struct Emotions_Previews: PreviewProvider {
        static var previews: some View {
            Emotions()
                .environmentObject(environmentObject())
        }
    }
