//
//  PassiveVoiceContentView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 03.07.2021.
//

import SwiftUI

struct PassiveVoiceContentView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView{
        LazyVStack{
            VStack{
                Text(model.modules[1].content.lessons[0].title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
            Text(model.modules[1].content.lessons[0].explanation)
            }
    }
        .padding(.horizontal, 10)
    }
    }
}

struct PassiveVoiceContentView_Previews: PreviewProvider {
    static var previews: some View {
        PassiveVoiceContentView().environmentObject(ContentModel())
    }
}
