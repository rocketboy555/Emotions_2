//
//  emvironmentObject.swift
//  Emotions
//
//  Created by ζδΈιζ on 2021/03/04.
//

import Foundation
import SwiftUI

class environmentObject: ObservableObject {
    @Published var TextEditor: Bool = false
    func TextEditorToggle(){TextEditor.toggle()}
}
