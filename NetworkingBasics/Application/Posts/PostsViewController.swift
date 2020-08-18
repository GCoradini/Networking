//
//  PostsViewController.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

final class PostsViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Attributes -
    private let user: User
    private var posts: [Post] = []
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        loadPosts()
    }
    
    // MARK: - Init -
    init(user: User) {
        self.user = user
        super.init()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Configuration -
    private func configureTableView() {
        tableView.register(
            UINib(
                nibName: "PostTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "PostTableViewCell"
        )
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Data Fetching -
    private func loadPosts() {
        NetworkingManager.getPost(for: user) { (result: Result<[Post], Error>) in
            switch result {
            case .success(let posts):
                self.posts = posts
                self.tableView.reloadData()
            case .failure:
                self.showAlert(
                    title: "Error fetching posts",
                    message: "Please, reopen the screen"
                )
            }
        }
    }
}

extension PostsViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
        cell.configure(for: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PostTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let viewController = CommentsViewController(post: post)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
