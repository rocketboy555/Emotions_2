//
//  EmotionsApp.swift
//  Emotions
//
//  Created by 村上開斗 on 2021/03/03.
//

import SwiftUI

struct EmoteButton: View {
    
    @EnvironmentObject private var emotion :environmentObject
    let today = getToday()
        .replacingOccurrences(of: ":", with: "")
        .replacingOccurrences(of: "/", with: "")
    let emoteText : String
    
    var body: some View {
        Button(action: {
            
            /// ファイル書き込み
            self.writingToFile(text:emoteText)
            
            /// ファイル読み込み
            /// 読み込んだファイルの内容を確認
//            print("【ファイル内容】\(self.readFromFile())")
            // テキストエディタクローズ
            emotion.TextEditorToggle()
        })
        {
            Text("Emote")
        }
    }
    
    /// ファイル書き込みサンプル
    func writingToFile(text: String) {
        /// ①DocumentsフォルダURL取得
        guard let dirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("フォルダURL取得エラー")
        }
        
        /// ②対象のファイルURL取得
//        let fileURL = dirURL.appendingPathComponent(today+".txt")
        let fileURL = dirURL.appendingPathComponent("test.txt")

        /// ③ファイルの書き込み
        do {
            try text.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("Error: \(error)")
        }
    }
}
/// ファイル読み込みサンプル
func readFromFile() -> String {
    
    /// ①DocumentsフォルダURL取得
    guard let dirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        fatalError("フォルダURL取得エラー")
    }
    
    /// ②対象のファイルURL取得
    let fileURL = dirURL.appendingPathComponent("test.txt")

    /// ③ファイルの読み込み
    guard let fileContents = try? String(contentsOf: fileURL) else {
        return "NG"
//        fatalError("ファイル読み込みエラー")
    }
    
    /// ④読み込んだ内容を戻り値として返す
    return fileContents
}
