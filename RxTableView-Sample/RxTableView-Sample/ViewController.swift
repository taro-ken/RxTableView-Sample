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


//自作データソースを使用する場合
final class MyDataSource: NSObject, UITableViewDataSource, RxTableViewDataSourceType {
    typealias Element = [SampleModel]
    var _itemModels: [SampleModel] = []

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _itemModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let element = _itemModels[indexPath.row]
        cell.textLabel?.text = element.name
        return cell
    }

    func tableView(_ tableView: UITableView, observedEvent: Event<Element>) {
        Binder(self) { dataSource, element in
            dataSource._itemModels = element
            tableView.reloadData()
        }
        .on(observedEvent)
    }
}

