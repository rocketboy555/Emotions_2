//
//  ContentView.swift
//  Emotions_2
//
//  Created by 村上開斗 on 2021/03/10.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    /// データ取得処理
    @FetchRequest(
        entity: EmotionEnt.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \EmotionEnt.timestamp, ascending: true)],
        predicate: nil
    ) private var emotionent: FetchedResults<EmotionEnt>
    
    @State private var currentTab = 0
    var body: some View {
        TabView(selection:$currentTab){
            ScrollView (.vertical, showsIndicators: false) {
                TimelineView()
            }
            .tabItem {
                VStack{
                    Image(systemName:"house")
                }
            }.tag(1)
            .onAppear(){
                self.currentTab = 0
            }
            WorldMap()
                .tabItem {
                    VStack{
                        Image(systemName:"globe")
                    }
                }.tag(2)
            Emotions()
                .tabItem {
                    VStack{
                        Image(systemName:"house")
                    }
                }.tag(3)
                .onAppear(){
                    self.currentTab = 2
                }
            Calendar()
                .tabItem {
                    VStack{
                        Image(systemName:"calendar")
                    }
                }.tag(4)
        }
    }

    //    var body: some View {
    //        NavigationView {    // ナビゲーションバーを表示する為に必要
    //            List {
    //                ForEach(items) { item in
    //                    Text("Item at \(item.timestamp!, formatter: itemFormatter)")
    //                }
    //                .onDelete(perform: deleteItems)
    //            }
    //            .toolbar {
    //                /// ナビゲーションバーの左にEditボタンを配置
    //                ToolbarItem(placement: .navigationBarLeading) {
    //                    EditButton()
    //                }
    //
    //                /// ナビゲーションバーの右に+ボタン配置
    //                ToolbarItem(placement: .navigationBarTrailing) {
    //                    Button(action: addItem) {
    //                        Label("Add Item", systemImage: "plus")
    //                    }
    //                }
    //            }
    //        }
    //    }


//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
