//
//  SkillStudy.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

import SwiftUI

struct SingleSkillView: View {
    var ifSkillPassed: Bool = false
    var body: some View {
        HStack {
            Text("我是一个SingleSkillView")
            if ifSkillPassed {
                Text("已学习完毕")
            }
            else {
                Text("有待学习")
            }
        }
    }
}

struct SkillStudy: View {
    
    @ObservedObject var document: FlowerArrange
    
    @State var selectedView: Int = 1
    
    var body: some View {
        
        TabView(selection: $selectedView) {
            test(document: document)
                .tabItem {
                    Text("测试")
                }
                .tag(0)
            SkillStudy_Part1(document: document)
                .tabItem {
                    Text("第一部分")
                }
                .tag(1)
            SkillStudy_Part2()
                .tabItem {
                    Text("第二部分")
                }
                .tag(2)
            SkillStudy_Part3()
                .tabItem {
                    Text("第三部分")
                }
        }
    }
}

struct SkillStudy_Part1: View {
    var document: FlowerArrange
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(
                        destination: SingleSkillView(ifSkillPassed: document.userModel.staticModel.ifJiFa1Pass),
                        label: {
                            Text("技法1")
                                .font(.system(size: 35))
                                .foregroundColor(.black)
                                .frame(width: 100, height: 150)
                                .border(.black)
                                .padding()
                        })
                    NavigationLink(
                        destination: SingleSkillView(ifSkillPassed: document.userModel.staticModel.ifJiFa2Pass),
                        label: {
                            Text("技法2")
                                .font(.system(size: 35))
                                .foregroundColor(.black)
                                .frame(width: 100, height: 150)
                                .border(.black)
                                .padding()
                        })
                }
                HStack {
                    NavigationLink(
                        destination: SingleSkillView(ifSkillPassed: document.userModel.staticModel.ifJiFa3Pass),
                        label: {
                            Text("技法3")
                                .font(.system(size: 35))
                                .foregroundColor(.black)
                                .frame(width: 100, height: 150)
                                .border(.black)
                                .padding()
                        })
                    NavigationLink(
                        destination: SingleSkillView(ifSkillPassed: document.userModel.staticModel.ifJiFa4Pass),
                        label: {
                            Text("技法4")
                                .font(.system(size: 35))
                                .foregroundColor(.black)
                                .frame(width: 100, height: 150)
                                .border(.black)
                                .padding()
                        })
                }
                HStack {
                    NavigationLink(
                        destination: SingleSkillView(ifSkillPassed: document.userModel.staticModel.ifJiFa5Pass),
                        label: {
                            Text("技法5")
                                .font(.system(size: 35))
                                .foregroundColor(.black)
                                .frame(width: 100, height: 150)
                                .border(.black)
                                .padding()
                        })
                    NavigationLink(
                        destination: SingleSkillView(ifSkillPassed: document.userModel.staticModel.ifJiFa6Pass),
                        label: {
                            Text("技法6")
                                .font(.system(size: 35))
                                .foregroundColor(.black)
                                .frame(width: 100, height: 150)
                                .border(.black)
                                .padding()
                        })
                }
            }
        }
    }
}

struct SkillStudy_Part2: View {
    var body: some View {
        Text("技法学习第二部分")
    }
}

struct SkillStudy_Part3: View {
    var body: some View {
        Text("技法学习第三部分")
    }
}
struct SkillStudy_Previews: PreviewProvider {
    static var previews: some View {
        SkillStudy(document: FlowerArrange())
    }
}
