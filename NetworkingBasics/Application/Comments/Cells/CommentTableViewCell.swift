//
//  CommentTableViewCell.swift
//  NetworkingBasics
//
//  Created by Usuario on 17/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    // MARK: - Views -
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    // MARK: - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Configuration -
    func configure(for comment: Comment) {
        nameLabel.text = comment.name
        emailLabel.text = comment.email
        bodyLabel.text = comment.body
    }
    
    // MARK: - Size -
    static var height: CGFloat {
        return 70.0
    }
}
