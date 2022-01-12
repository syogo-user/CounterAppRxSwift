//
//  ViewController.swift
//  CounterAppRxSwift
//
//  Created by 小野寺祥吾 on 2022/01/11.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var countLable: UILabel!
    @IBOutlet weak var countUpButton: UIButton!
    @IBOutlet weak var countDownButton: UIButton!
    @IBOutlet weak var countResetButton: UIButton!
    
    private let disposeBag = DisposeBag()
    private var viewModel: CounterRxViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel = CounterRxViewModel()
        let input = CounterViewModelInput(
            countUpButton: countUpButton.rx.tap.asObservable(), countDownButton: countDownButton.rx.tap.asObservable(), countResetButton: countResetButton.rx.tap.asObservable()
        )
        viewModel.setup(input: input)
        
        viewModel.outputs?.counterText
            .drive(countLable.rx.text)
            .disposed(by: disposeBag)
    }
    
}

