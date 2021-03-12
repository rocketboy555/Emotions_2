//
//  getToday.swift
//  Emotions
//
//  Created by 村上開斗 on 2021/03/06.
//

import Foundation
import SwiftUI

func getToday()->String{
    let time = DateFormatter()
    time.dateStyle = .medium
    time.timeStyle = .medium
    time.locale = Locale(identifier:"ja_JP")
    let now = Date()
    return time.string(from: now)
}
