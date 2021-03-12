//
//  emvironmentObject.swift
//  Emotions
//
//  Created by 村上開斗 on 2021/03/04.
//

import Foundation
import SwiftUI

class environmentObject: ObservableObject {
    @Published var TextEditor: Bool = false
    func TextEditorToggle(){TextEditor.toggle()}
}
