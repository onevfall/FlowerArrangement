//
//  SkillStudy.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

import SwiftUI

struct SkillStudy: View {
    
    @ObservedObject var document: FlowerArrange
    @State var ifJiFa1Pass = false
    @State var ifJiFa2Pass = false
    @State var ifJiFa3Pass = false
    @State var ifJiFa4Pass = false
    @State var ifJiFa5Pass = false
    @State var ifJiFa6Pass = false
    var body: some View {
        VStack {
            HStack {
                Button {
                    ifJiFa1Pass.toggle()
                } label: {
                    Text("基础篇")
                        .font(.system(size: 25))
                        .padding()
                }
                .border(.black)

                Spacer()
                
                Button {
                    //Action
                } label: {
                    Text("进阶篇")
                        .font(.system(size: 25))
                        .padding()
                }
                .border(.black)

                Spacer()
                
                Button {
                    //Action
                } label: {
                    Text("高级篇")
                        .font(.system(size: 25))
                        .padding()
                }
                .border(.black)
            }
            Spacer()
            HStack {
                JiFa1
                    .modifier(StyleOfStudyButton(ifPass: ifJiFa1Pass))
                JiFa2
                    .modifier(StyleOfStudyButton(ifPass: ifJiFa2Pass))
            }
            HStack {
                JiFa3
                    .modifier(StyleOfStudyButton(ifPass: ifJiFa3Pass))
                JiFa4
                    .modifier(StyleOfStudyButton(ifPass: ifJiFa4Pass))
            }
            HStack {
                JiFa5
                    .modifier(StyleOfStudyButton(ifPass: ifJiFa5Pass))
                JiFa6
                    .modifier(StyleOfStudyButton(ifPass: ifJiFa6Pass))
            }
            Spacer()
        }

        
    }
    
    var JiFa1: some View {
        Button("技法1") {
            ifJiFa1Pass.toggle()
        }
    }
    
    var JiFa2: some View {
        Button("技法2") {
            //Action
            ifJiFa2Pass.toggle()
        }
    }
    
    var JiFa3: some View {
        Button("技法3") {
            //Action
            ifJiFa3Pass.toggle()

        }
    }
    
    var JiFa4: some View {
        Button("技法4") {
            //Action
            ifJiFa4Pass.toggle()

        }
    }
    
    var JiFa5: some View {
        Button("技法5") {
            //Action
            ifJiFa5Pass.toggle()

        }
    }
    
    var JiFa6: some View {
        Button("技法6") {
            //Action
            ifJiFa6Pass.toggle()

        }
    }
}

struct SkillStudy_Previews: PreviewProvider {
    static var previews: some View {
        SkillStudy(document: FlowerArrange())
    }
}
