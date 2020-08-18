//
//  PostTableViewCell.swift
//  NetworkingBasics
//
//  Created by Usuario on 17/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Views -
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    // MARK: - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Configuration -
    func configure(for post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
    
    // MARK: - Size -
    static var height: CGFloat {
        return 50.0
    }
}
