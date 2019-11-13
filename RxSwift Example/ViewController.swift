//
//  ViewController.swift
//  RxSwift Example
//
//  Created by Ahsan Ateeq on 08/11/2019.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxCocoaRuntime

class ViewController: UIViewController {

    let vm = ViewModal()
    private let disposeBag = DisposeBag()
    
    
    
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var table: UITableView!
    
    var data: PublishSubject<[String]> = PublishSubject()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(ModelTableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        setUpBinding()

        
        
    }
    
    
    func setUpBinding() {
        
        table.dataSource = nil
        table.delegate = nil
        
        
        vm.arr.bind(to: table.rx.items(cellIdentifier: "cell")) {
            (row, model, cell) in
            
            if let cellToUse = cell as? ModelTableViewCell {
                cellToUse.textLabel?.text = model
            }
            
        }.disposed(by: disposeBag)

    }

    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    @IBAction func addString(_ sender: UIButton) {
        
        vm.addString(str: text.text!)
        
    }
    

}

