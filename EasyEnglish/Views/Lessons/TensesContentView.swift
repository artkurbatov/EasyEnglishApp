//
//  TensesContentView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 03.07.2021.
//

import SwiftUI

struct TensesContentView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
    
        ScrollView{
        LazyVStack{
        ForEach(0..<model.modules[0].content.lessons.count) { lesson in
            VStack{
                Text(model.modules[0].content.lessons[lesson].title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
            Text(model.modules[0].content.lessons[lesson].explanation)
                .padding(.bottom, 15)
            }
            Divider()
        }
    }
        .padding(.horizontal, 10)
    }
        }
    }

struct TensesContentView_Previews: PreviewProvider {
    static var previews: some View {
        TensesContentView().environmentObject(ContentModel())
    }
}
