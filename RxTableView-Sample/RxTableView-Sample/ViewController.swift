//
//  ViewController.swift
//  RxTableView-Sample
//
//  Created by 木元健太郎 on 2022/06/08.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {
    
    private var tableViewCell = "TableViewCell"
    private var viewModel = SampleViewModel()
    private var disposeBag = DisposeBag()
    
    @IBOutlet weak var rxTableView: UITableView! {
        didSet {
            rxTableView.register(UINib(nibName: tableViewCell, bundle: nil), forCellReuseIdentifier: tableViewCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        viewModel.rxModel.bind(to: rxTableView.rx.items(cellIdentifier: tableViewCell, cellType: TableViewCell.self)) { row, element, cell in
            cell.configure(model: element)
        }.disposed(by: disposeBag)
    }
}

