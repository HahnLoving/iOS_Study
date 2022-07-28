//
//  AsyncAndAwaitController.swift
//  StudySwift
//
//  Created by z Hahn on 2022/7/25.
//

import UIKit

class AsyncAndAwaitController: BaseController {

    var img: UIImageView = UIImageView()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.img = UIImageView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100))
        self.view.addSubview(self.img)
        
//        blockGetImage {
//            self.img.image = UIImage(data: $0)
//        }
        
        Task {
            self.img.image = await UIImage(data: asyncGetImage())
        }
    }
    

}
