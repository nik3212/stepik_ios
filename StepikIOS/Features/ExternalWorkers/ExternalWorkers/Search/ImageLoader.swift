public protocol ImageLoaderProtocol {
    static func loadImage(url: String, _ completion: @escaping (Result<UIImage>)->())
}

import Alamofire

public class ImageLoader: ImageLoaderProtocol {
    public init() {}
    
    public static func loadImage(url: String, _ completion: @escaping (Result<UIImage>)->()) {
        let imageLoader = Alamofire.request(url)
        
        imageLoader.response(queue: nil) { (data) in
            if let data = data.data {
                let image = UIImage(data: data, scale: 1)
                completion(.Success(image!))
            } else {
                completion(.Error)
            }
        }
    }
}
