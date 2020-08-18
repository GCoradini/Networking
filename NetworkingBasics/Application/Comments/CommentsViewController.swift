//
//  CommentsViewController.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

final class CommentsViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Attributes -
    private let post: Post
    private var comments: [Comment] = []
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        loadComments()
    }

    // MARK: - Init -
    init(post: Post) {
        self.post = post
        super.init()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Configuration -
    private func configureTableView() {
        tableView.register(
            UINib(
                nibName: "CommentTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "CommentTableViewCell"
        )
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Data Fetching -
    private func loadComments() {
        NetworkingManager.getComments(in: post) { (result: Result<[Comment], Error>) in
            switch result {
            case .success(let comments):
                self.comments = comments
                self.tableView.reloadData()
            case .failure:
                self.showAlert(
                    title: "Error fetching comments",
                    message: "Please, reopen the screen"
                )
            }
        }
    }
}

extension CommentsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell") as! CommentTableViewCell
        cell.configure(for: comments[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CommentTableViewCell.height
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
