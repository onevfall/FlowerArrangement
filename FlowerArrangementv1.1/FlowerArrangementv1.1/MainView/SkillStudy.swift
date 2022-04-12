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
                    .modifier(StyleOfStudyButton())
            }
            HStack {
                JiFa3
                    .modifier(StyleOfStudyButton())
                JiFa4
                    .modifier(StyleOfStudyButton())
            }
            HStack {
                JiFa5
                    .modifier(StyleOfStudyButton())
                JiFa6
                    .modifier(StyleOfStudyButton())
            }
            Spacer()
        }

        
    }
    
    var JiFa1: some View {
        Button("技法1") {
            //Action
            
        }
    }
    
    var JiFa2: some View {
        Button("技法2") {
            //Action
            
        }
    }
    
    var JiFa3: some View {
        Button("技法3") {
            //Action
            
        }
    }
    
    var JiFa4: some View {
        Button("技法4") {
            //Action

        }
    }
    
    var JiFa5: some View {
        Button("技法5") {
            //Action

        }
    }
    
    var JiFa6: some View {
        Button("技法6") {
            //Action

        }
    }
}

struct SkillStudy_Previews: PreviewProvider {
    static var previews: some View {
        SkillStudy(document: FlowerArrange())
    }
}
