//
//  AsyncAndAwaitView.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/7/25.
//

import SwiftUI

struct AsyncAndAwaitView: View {
    
    @State var data = Data()
    // block方式得到图片的Data
    private func blockGetImage(completionHandler: @escaping(Data) -> Void) {
        
        DispatchQueue.global().async {
            let url : URL = URL(string: "http://i8-static.jjwxc.net/tmp/backend/authorspace/s1/28/27087/2708639/20220518224228.jpg")!
            let data : Data = try! Data(contentsOf: url)
            DispatchQueue.main.async {
                completionHandler(data)
            }
        }
    }
    
    // async方式得到图片的Data
    private func asyncGetImage() async -> Data {
        do {
            let (d, _) = try await URLSession.shared.data(for: URLRequest(url: URL(string: "http://i8-static.jjwxc.net/tmp/backend/authorspace/s1/28/27087/2708639/20220518224228.jpg")!))
            return d
        } catch {
            return Data()
        }
    }
    
    
    var body: some View {
        VStack
        {
            Image(uiImage: UIImage(data: data) ?? UIImage())
                .resizable()
        }
        .onAppear {
            print("name = \(self)")
//            blockGetImage {
//                data = $0
//            }
        }
        .task {
            data = await asyncGetImage()
        }
        .navigationTitle("async和await")
    }
}
