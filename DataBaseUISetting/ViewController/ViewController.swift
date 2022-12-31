//
//  ViewController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/11/09.
//

import UIKit

final class ViewController: UIViewController {
    
    lazy var array:Movies = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    let db = dbManager.shared
    
    private let flowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetting()
        collectionViewLayoutSetting()
        movieListGet()
    }
    
    func movieListGet() {
        db.fetchUser(searchTerm: "http://localhost/MovieApp/movie.php") { result in
//            dump(result)
            switch result {
            case .success(let musicDatas):
                self.array = musicDatas as! Movies
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func collectionViewSetting() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
        collectionView.backgroundColor = .white
    }
    
    func collectionViewLayoutSetting() {
        flowLayout.scrollDirection = .vertical
        let collectionCellWidth = (UIScreen.main.bounds.width - CVCell.spacingWitdh * (CVCell.cellColumns - 1)) / CVCell.cellColumns
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth+100)
        // 아이템 사이 간격 설정
        flowLayout.minimumInteritemSpacing = CVCell.spacingWitdh
        // 아이템 위아래 사이 간격 설정
        flowLayout.minimumLineSpacing = CVCell.spacingWitdh
        // 컬렉션뷰의 속성에 할당
        collectionView.collectionViewLayout = flowLayout
    }

}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
//        cell.mainImgView.image = UIImage(systemName: "Bold")
        cell.mainLabel.text = array[indexPath.item].movieTitle
        cell.subLabel.text = array[indexPath.item].actor
        cell.detailLabel.text = array[indexPath.item].director
        cell.accessibilityContainerType = .none
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailController") as? MovieDetailController else { return }
        let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        nextVC.movieImg = cell.mainImgView.image
        nextVC.movieTitle = cell.mainLabel.text
        nextVC.movieSub = cell.subLabel.text
        nextVC.movieDetail = cell.detailLabel.text// 필요한 정보 넘긴후 넘어갈 페이지 셋팅
        self.present(nextVC, animated: true)// 화면이동
    }
    
    
}

