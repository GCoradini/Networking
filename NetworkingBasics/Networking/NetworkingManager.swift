//
//  NetworkingManager.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkingManager {
    static func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        AF  .request(
                "https://jsonplaceholder.typicode.com/users",
                method: .get,
                parameters: nil
            )
            .responseData { (response: AFDataResponse<Data>) in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let users = try decoder.decode([User].self, from: data)
                        completion(.success(users))
                    } catch {
                        completion(.failure(error))
                    }
                case.failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func getAlbums(for user: User, completion: @escaping (Result<[Album], Error>) -> Void) {
        AF  .request(
                "https://jsonplaceholder.typicode.com/albums",
                method: .get,
                parameters: ["userId": user.id]
            )
            .responseData { (response: AFDataResponse<Data>) in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let albums = try decoder.decode([Album].self, from: data)
                        completion(.success(albums))
                    } catch {
                        completion(.failure(error))
                    }
                case.failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func getPhotos(in album: Album, completion: @escaping (Result<[Photo], Error>) -> Void) {
        AF  .request(
                "https://jsonplaceholder.typicode.com/photos",
                method: .get,
                parameters: ["albumId": album.id]
            )
            .responseData { (response: AFDataResponse<Data>) in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let albums = try decoder.decode([Photo].self, from: data)
                        completion(.success(albums))
                    } catch {
                        completion(.failure(error))
                    }
                case.failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func getPost(for user: User, completion: @escaping (Result<[Post], Error>) -> Void) {
        AF  .request(
                "https://jsonplaceholder.typicode.com/posts",
                method: .get,
                parameters: ["userId": user.id]
            )
            .responseData { (response: AFDataResponse<Data>) in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let posts = try decoder.decode([Post].self, from: data)
                        completion(.success(posts))
                    } catch {
                        completion(.failure(error))
                    }
                case.failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func getComments(in post: Post, completion: @escaping (Result<[Comment], Error>) -> Void) {
        AF  .request(
                "https://jsonplaceholder.typicode.com/comments",
                method: .get,
                parameters: ["postId": post.id]
            )
            .responseData { (response: AFDataResponse<Data>) in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let comments = try decoder.decode([Comment].self, from: data)
                        completion(.success(comments))
                    } catch {
                        completion(.failure(error))
                    }
                case.failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
