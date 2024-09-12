import UIKit
import SnapKit
import Then

class QuestionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var cellIndex = 0
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    
    private let nextButton = CYSButton(type: .next)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        add()
        layout()
    }
    
    private func attribute() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        self.collectionView.register(QuestionCell.self, forCellWithReuseIdentifier: QuestionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        
        nextButton.button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        self.navigationItem.hidesBackButton = true
    }
    
    private func add() {
        [
            collectionView,
            logoImage,
            nextButton
        ].forEach{ view.addSubview($0) }
    }
    
    private func layout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(65)
            $0.left.equalToSuperview().inset(20)
            $0.height.equalTo(37)
            $0.width.equalTo(73)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(56)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(70)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuestionCell.identifier, for: indexPath) as? QuestionCell
//        self.cellIndex += 1
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    @objc private func nextButtonTapped() {
        print("nextButton 클릭됨")
        print(cellIndex)
        cellIndex += 1
        self.collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: IndexPath(row: self.cellIndex, section: 0), at: .left, animated: true)
        self.collectionView.isPagingEnabled = true
        
        if cellIndex >= 15 {
            self.navigationController?.pushViewController(EndViewController(), animated: true)
            cellIndex = 0
        }
    }
}
