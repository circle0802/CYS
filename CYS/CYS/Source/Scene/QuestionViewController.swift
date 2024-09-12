import UIKit
import SnapKit
import Then

class QuestionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var cellIndex = 0
    
<<<<<<< HEAD
    let question = [
        "지금까지 쓴 독후감의 개수를 \n입력해주세요!",
        "지금까지 참여한 \n독서활동 프로그램의 개수를 \n입력해주세요!",
        "지금까지 한 봉사활동 시간을 \n입력해주요!",
        "지금까지 모은 상점을 \n입력해주세요!",
        "지금까지 관람한 예술 관람의 \n개수를 입력해주세요!",
        "체험형 현장실습에 \n참여하셨나요?",
        "지금까지 취득한 자격증의 \n개수를 입력하세요!",
        "사제 동행 등반에 \n참여하셨나요?",
        "사제 동행 등반에서 \n완주하셨나요?",
        "TOPCIT에 응시하셨나요?",
        "TOPCIT 점수를 \n입력해주세요!",
        "프로젝트를 진행하셨나요?(1년동안)",
        ""
    ]
    
=======
>>>>>>> origin/main
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
<<<<<<< HEAD
        cell?.label.text = question[cellIndex]
=======
//        self.cellIndex += 1
>>>>>>> origin/main
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
<<<<<<< HEAD
        return question.count
=======
        return 16
>>>>>>> origin/main
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
        
<<<<<<< HEAD
        if cellIndex >= question.count-1 {
=======
        if cellIndex >= 15 {
>>>>>>> origin/main
            self.navigationController?.pushViewController(EndViewController(), animated: true)
            cellIndex = 0
        }
    }
}
