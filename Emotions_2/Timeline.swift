//
//  Timeline.swift
//  Emotions
//
//  Created by 村上開斗 on 2021/03/06.
//

import SwiftUI

//
//  TimelineView.swift
//

import SwiftUI

struct Timeline {
    var id: Int
    var name: String
    var image: String
    var post: String
    var post_image: String
}

struct TimelineView: View {
//    timelines.append(Timeline(id: 0, name: "Arupaka", image: "animal_arupaka", post: readFromFile(), post_image: "ice_1"))
    @State var timelines: [Timeline] = [
        Timeline(id: 0, name: "Arupaka", image: "animal_arupaka", post: readFromFile(), post_image: "ice_1")
    ]
    var body: some View {
        VStack() {
            ForEach(self.timelines, id: \.id) { (timeline) in
                VStack(spacing: 5) {
                    HStack(alignment: .top) {
                        Image(timeline.image)
                            .resizable()
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 4))
                            .frame(width: 60, height: 60, alignment: .leading)
                        VStack(alignment: .leading) {
                            HStack {
                                Text(timeline.name)
                                    .fontWeight(.bold)
                                Text("@\(timeline.name)")
                                    .foregroundColor(.gray)
                            }
                            Text(timeline.post)
                            Image(timeline.post_image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal, 10)
                    Divider()
                }
            }
        }
    }
    func mkTimeline (){
        self.timelines = [
            Timeline(id: 0, name: "Arupaka", image: "animal_arupaka", post: readFromFile(), post_image: "ice_1")
        ]
    }
}

//struct TimelineView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimelineView(timelines: timelines)
//    }
//}
