//
//  ContentView.swift
//  SwiftUI_Tutorial
//
//  Created by KeunHyeong on 2020/10/25.
//  Copyright © 2020 KeunHyeong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // @State 값의 변화를 감지 -> 뷰에 적용
       @State
       private var isActivated: Bool = false
       
       // 몸체
       var body: some View {
           
           NavigationView{
               VStack{
                   HStack{
                       MyStackView(isActivated: $isActivated)
                       MyStackView(isActivated: $isActivated)
                       MyStackView(isActivated: $isActivated)
                       
                   } // Hstack
                       .padding(isActivated ? 50.0 : 10.0)
                       //
                       .background(isActivated ? Color.yellow : Color.black)
                      
                       .onTapGesture {
                           print("HStack 이 클릭되었다.")
                           
                           // 애니메이션과 함께
                           withAnimation {
                               self.isActivated.toggle()
                           }
                   }
                   
                   NavigationLink(destination: MyTextView(isActivated: $isActivated) ){
                       Text("네비게이션")
                           .font(.system(size: 40))
                           .fontWeight(.bold)
                           .padding()
                           .background(Color.orange)
                           .foregroundColor(Color.white)
                           .cornerRadius(30)
                       
                   } .padding(.top, 50)
               }
               
           } // NavigationView
           
           
           
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
