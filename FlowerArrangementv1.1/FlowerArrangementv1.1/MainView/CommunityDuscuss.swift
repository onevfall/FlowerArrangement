//
//  CommunityDuscuss.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/12.
//

import SwiftUI

struct CommunityDuscuss: View {
    
    @ObservedObject var document: FlowerArrange
    
    // 调用数据库，得到相关数据data
    // 使用foreach对data迭代得到[PostContent]，每份数据都转换为一个View填在ScrollView中
    struct PostContent {
        var image: UIImage
        var username: String
        var contentText: String
        var contentImage: UIImage
        //var contentImages: [UIImage] /// 添加多图
    }
    
    var body: some View {
        GeometryReader { geometry in
            let widthOfFatherView = geometry.size.width
            let heightOfFatherView = geometry.size.height
            VStack {
                HStack {
                    Text("社区分享")
                        .font(.system(size: heightOfFatherView / 18)) // 根据屏幕高度调节字体大小
                    Spacer()
                    Button {
                        // 发帖
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: heightOfFatherView / 18, height: heightOfFatherView / 18)
                            .padding(5)
                    }
                    .overlay(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)).stroke(.black))
                }
                .padding()
                Divider()
                ScrollView(.vertical, showsIndicators: true) {
                    // 添加具体帖子 使用ForEach遍历[PostCOntent]依次生成对应的PostView
                    // example
                    PostView(postContent: PostContent(image: UIImage(systemName: "person.fill")!, username: "testUsername1", contentText: "我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字", contentImage: UIImage(systemName: "folder.fill")!))
                    Divider()
                    PostView(postContent: PostContent(image: UIImage(systemName: "person.fill")!, username: "testUsername2", contentText: "我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字", contentImage: UIImage(systemName: "folder.fill")!))
                    PostView(postContent: PostContent(image: UIImage(systemName: "person.fill")!, username: "testUsername3", contentText: "我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字我是一长段文字", contentImage: UIImage(systemName: "folder.fill")!))
                    Divider()
                }
                .padding()
            }
        }
    }
    
    struct PostView: View {
        let postContent: PostContent
        var body: some View {
            VStack {
                HStack {
                    Image(uiImage: postContent.image) // 头像
                    Text(postContent.username) // 昵称
                    Spacer()
                    Text("Post Info")
                }
                .frame(height: 20, alignment: .leading)
                .padding(.leading)
                Text(postContent.contentText) // 文本
                Image(uiImage: postContent.contentImage)

                // 需要[UIImage]为Identifiable类型
//                LazyVStack {
//                    ForEach(postContent.contentImages.) { contentImage in
//                        Image(contentImage)
//                    }
//                }
                HStack {
                    Spacer()
                    Text("收") // 收藏
                    Text("赞") // 点赞
                    Text("评") // 评论
                }
                .padding()
            }
        }
    }
    
}

struct CommunityDuscuss_Previews: PreviewProvider {
    static var previews: some View {
        CommunityDuscuss(document: FlowerArrange())
    }
}
