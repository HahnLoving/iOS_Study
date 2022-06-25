//
//  WidgetImageLoader.swift
//  MyWidgetExtension
//
//  Created by z Hahn on 2022/6/22.
//


import Foundation
import SwiftUI

enum WidgetError: Error {
    case netError //网络请求出错
    case dataError //数据解析错误
}


/*
 
 由于不支持异步加载图片
 所以暂时在网络请求好之后，直接下载好全部图片
 使用NSCache暂存图片
 */
class WidgetImageLoader {
    
    static var shareLoader = WidgetImageLoader()
    private var cache = NSCache<NSURL, UIImage>()
    
    /// 下载单张图片
    /// - Parameters:
    ///   - imageUrl: 图片URL
    ///   - completion: 成功的回调
    func downLoadImage(imageUrl: String?,completion: @escaping (Result<Image, WidgetError>) -> Void) {
        if let imageUrl = imageUrl {
            if let cacheImage  = self.cache.object(forKey: NSURL(string: imageUrl)!) {
                completion(.success(Image(uiImage: cacheImage)))
            } else {
                URLSession.shared.dataTask(with: URL(string: imageUrl)!) { (data, response, error) in
                    if let data = data,
                       let image = UIImage(data: data) {
                        self.cache.setObject(image, forKey: NSURL(string: imageUrl)!)
                        completion(.success(Image(uiImage: image)))
                    } else {
                        completion(.failure(WidgetError.netError))
                    }
                }.resume()
            }
        } else {
            completion(.failure(WidgetError.dataError))
        }
    }
    
    /// 批量下载图片
    /// - Parameters:
    ///   - imageAry: 图片数组集合
    ///   - placeHolder: 占位图，可传可不传
    ///   - completion: 成功回调
    func downLoadImage(imageAry:[String],placeHolder:Image?,completion: @escaping (Result<[Image], WidgetError>) -> Void) {
        let group:DispatchGroup = DispatchGroup()
        var array = [Image]()
        for image in imageAry {
            group.enter()
            self.downLoadImage(imageUrl: image) { result in
                let image : Image
                if case .success(let response) = result {
                    image = response
                } else {
                    image = placeHolder ?? Image("")
                }
                array.append(image)
                group.leave()
            }
        }
        group.notify(queue: DispatchQueue.main) {
            completion(.success(array))
        }
    }
    
    /// 获取image
    /// - Parameters:
    ///   - imageUrl: 图片地址
    ///   - placeHolderImage: 占位图，请尽量传入
    /// - Returns: 返回结果
    func getImage(_ imageUrl:String, _ placeHolderImage:UIImage?) -> UIImage {
        if let cacheImage  = self.cache.object(forKey: NSURL(string: imageUrl)!) {
            return cacheImage
        } else {
            if let cacheImag = placeHolderImage {
                return cacheImag
            } else {
                return UIImage()
            }
        }
    }
}
