//
//  CinemaSelectController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/12/23.
//

import UIKit

final class CinemaSelectController: UIViewController {
    
    @IBOutlet weak var cinemaPickerView: UIPickerView!
    var abc = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cinemaPickerView.delegate = self
        cinemaPickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension CinemaSelectController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(abc)
    }
    
}

extension CinemaSelectController: UIPickerViewDelegate {
    
}
