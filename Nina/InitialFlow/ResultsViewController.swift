//
//  ResultsViewController.swift
//  Nina
//
//  Created by Emannuel Carvalho on 28/04/20.
//  Copyright © 2020 Emannuel Carvalho. All rights reserved.
//

import UIKit
import CoreData

class ResultsViewController: UIViewController {
    
    var results = [DailyResult]() {
        didSet {
            updateUI()
        }
    }
    
    var dataSource: TableViewDataSourceDelegate<ResultItemTableViewCell>?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView().notTranslating()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = Color.secondary
        
        return tableView
    }()
    
    override func loadView() {
        view = UIView().backgrounded(color: Color.secondary)
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        loadResults()
        updateUI()
    }
    
    fileprivate func setupDataSource() {
        dataSource = TableViewDataSourceDelegate<ResultItemTableViewCell>(data: results) { [weak self] (item, _) in
            self?.show(results: item)
        }
        dataSource?.setup(tableView: tableView)
    }
    
    fileprivate func show(results: DailyResult) {
        let vc = InitialViewController(result: results)
        navigationController?.show(vc, sender: nil)
    }
    
    fileprivate func setupViews() {
        tableView.fill(view: view)
    }
    
    fileprivate func updateUI() {
        dataSource?.data = results
        tableView.reloadData()
    }
    
    fileprivate func loadResults() {
        let request = DailyResult.fetchRequest() as NSFetchRequest<DailyResult>
        let sort = NSSortDescriptor(key: #keyPath(DailyResult.date), ascending: true)
        request.sortDescriptors = [sort]
        results = (try? view.context?.fetch(request)) ?? []
    }
    
}
