//
//  Texteditor.swift
//  Emotions
//
//  Created by 村上開斗 on 2021/03/03.
//

import SwiftUI

struct Texteditor: View {
    private static let placeholder = "いまの気持ちは？"
    @State private var outputText: String = ""
    @State private var placeholderText = placeholder
    @EnvironmentObject private var emotion :environmentObject
    
    init(){
        outputText = placeholderText
    }
    
    var body: some View {
        VStack{
            Spacer()
            if #available(iOS 14.0 , * ){
                ZStack(alignment:.topLeading){
                    RoundedRectangle(cornerRadius: 20.0)
                        .strokeBorder().foregroundColor(.gray)
                        .background(Color.clear)
                    TextEditor(text: $outputText)
                        .padding()
                        .foregroundColor(.black)
                        .onTapGesture{
                            if outputText.isEmpty{
                                placeholderText = ""
                            }
                        }
                        .onChange(of: outputText){ value in
                            if outputText.isEmpty {
                                placeholderText = Self.placeholder
                            }else{
                                placeholderText = ""
                            }
                        }
                    Text(placeholderText)
                        .padding()
                        .foregroundColor(.gray)
                }
                .frame(width:300,height:500,alignment:.center)
            }else{
                EmptyView()
            }
            HStack{
                Spacer()
                Button(action: {emotion.TextEditorToggle()}) {
                    Text("cancel")
                }
                Spacer()
                EmoteButton(emoteText: outputText)
                Spacer()
            }
            Spacer()
            
        }
    }
}

struct Texteditor_Previews: PreviewProvider {
    static var previews: some View {
        Texteditor()
    }
}
