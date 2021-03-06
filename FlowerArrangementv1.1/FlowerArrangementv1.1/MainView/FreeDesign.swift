//
//  FreeDesign.swift
//  FlowerArrangementv1.1
//
//  Created by εη on 2022/4/3.
//

import SwiftUI

struct FreeDesign: View {
    
    @ObservedObject var document: FlowerArrange
    
    let testFlowers = "π΄π±πΏβοΈππ³π²ππ΅πππππ·ππΉπ₯πΊπΈπΌ"
    let testVases = "β½οΈππβΎοΈπ₯πΎπππ₯π±πͺππΈπππ₯π"
    var body: some View {
        GeometryReader { geometry in
            let widthOfFatherView = geometry.size.width
            let heightOfFatherView = geometry.size.height
            ZStack {
                HStack {
                    VStack(alignment: .leading) {
                        goBackButton
                        shootButton
                        flowerSelectButton
                        vaseSelectButton
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        generateButton
                            .padding()
                        ScrollingFlowersView(flowers: testFlowers)
                            .font(.system(size: 50))
                            .frame(width: widthOfFatherView * 0.3, height: heightOfFatherView * 0.8)
                        Spacer()
                    }
                }
                VStack {
                    Spacer()
                    ScrollingVaseView(vases: testVases)
                        .font(.system(size: 30))
                }
            }
        }

        
    }
    
    struct ScrollingFlowersView: View {
        let flowers: String
        
        var body: some View {
            ScrollView(.vertical) {
                VStack {
                    ForEach(flowers.map { String($0) }, id: \.self) { flower in
                        Text(flower)
                    }
                }
            }
        }
    }
    
    struct ScrollingVaseView: View {
        let vases: String
        var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(vases.map { String($0) }, id: \.self) { vase in
                        Text(vase)
                    }
                }
            }
        }
    }
    
    var goBackButton: some View {
        Button {
            // back action
        } label: {
            Text("π")
                .font(.system(size: 30))
                .padding(5)
                .border(.black)
                .foregroundColor(.black)
        }
        .padding()
    }
    
    var shootButton: some View {
        Button {
            // use camera
        } label: {
            Image("cameraImage", label: Text("δ½Ώη¨ηΈζΊ"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .padding()
        }
    }
    
    var flowerSelectButton: some View {
        Button {
            // choose flower
        } label: {
            Text("ιζ©θ±ε")
                .padding([.top, .leading, .bottom], 5)
                .border(.black)
        }
    }
    
    var vaseSelectButton: some View {
        Button {
            // choose vase
        } label: {
            Text("ιζ©θ±ηΆ")
                .padding([.top, .leading, .bottom], 5)
                .border(.black)
        }
    }
    
    var generateButton: some View {
        Button {
            // generate solution
        } label: {
            Text("ηζ")
                .font(.system(size: 30))
                .padding(5)
                .border(.black)
                .foregroundColor(.black)
        }
    }
}

struct FreeDesign_Previews: PreviewProvider {
    static var previews: some View {
        FreeDesign(document: FlowerArrange())
    }
}
