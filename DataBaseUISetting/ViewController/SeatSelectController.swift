//
//  SeatSelectController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/12/23.
//

import UIKit

class SeatSelectController: UIViewController {
    
    let array = Array(1...35)
    var arr: Array<String> = []
    @IBOutlet var seatCollectionView: UICollectionView!
    @IBOutlet var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetting()
        // Do any additional setup after loading the view.
    }
    
    func collectionViewSetting(){
        seatCollectionView.delegate = self
        seatCollectionView.dataSource = self
        seatCollectionView.register(UINib(nibName: "SeatCell", bundle: nil), forCellWithReuseIdentifier: "SeatCell")
        seatCollectionView.backgroundColor = .white
        seatCollectionView.isMultipleTouchEnabled = true
    }
    
    @IBAction func orderBtnTapped(_ sender: UIButton) {
        
    }

}

extension SeatSelectController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = seatCollectionView.dequeueReusableCell(withReuseIdentifier: "SeatCell", for: indexPath) as! SeatCell
        
        cell.seatNum.text = String(array[indexPath.item])
        return cell
    }
    
    
}

extension SeatSelectController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SeatCell
        if cell.backgroundColor == .darkGray {
            cell.backgroundColor = .lightGray
            arr.append(cell.seatNum.text!)
//            str = str + "&" + (cell.seatNum.text)!
        }
        else {
            cell.backgroundColor = .darkGray
            //간단하게 arr 추가 삭제 후 arr 내용만 출력한다면 ?
            arr = arr.filter(){$0 != cell.seatNum.text}
            
        }
        let stringArray = arr
        let string = stringArray.joined(separator: "&")
        resultLabel.text = string
    }
}

extension SeatSelectController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
