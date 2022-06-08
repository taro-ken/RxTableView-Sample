//
//  TableViewCell.swift
//  RxTableView-Sample
//
//  Created by 木元健太郎 on 2022/06/08.
//

import UIKit

final class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(model: SampleModel) {
        nameLabel.text = model.name
    }
}
