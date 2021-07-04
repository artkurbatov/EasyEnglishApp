//
//  QuestionsContentView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 03.07.2021.
//

import SwiftUI

struct QuestionsContentView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView{
        LazyVStack{
        ForEach(0..<model.modules[2].content.lessons.count) { lesson in
            VStack{
                Text(model.modules[2].content.lessons[lesson].title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
            Text(model.modules[2].content.lessons[lesson].explanation)
                .padding(.bottom, 15)
            }
            Divider()
        }
    }
        .padding(.horizontal, 10)
    }
    }
}

struct QuestionsContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsContentView().environmentObject(ContentModel())
    }
}
