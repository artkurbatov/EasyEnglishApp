//
//  DescriptionView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 01.08.2021.
//

import SwiftUI

struct DescriptionView: View {
    
    
    @State var lesson : Lesson

    var dataToShow : String {
        return  lesson.explanation[0]
    }
    @State var idx = 0
    
    var body: some View
    {
      VStack
      {
        Button(action: {
                dataToShow = ""
                idx += 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01)
                {
                    dataToShow = DescriptionView.data[idx]
                }}, label: {
            Text("Toggle")
        })
        ScrollView
        {
            Text(dataToShow)
        }
      }
    }
  }

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
