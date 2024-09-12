import UIKit
import SnapKit
import Then

class QuestionCell: UICollectionViewCell {
    
    static let identifier = "QuestionCell"
    
<<<<<<< HEAD
    public let label = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 25)
        $0.textAlignment = .center
        $0.numberOfLines = 0
=======
    private let label = UILabel().then {
        $0.text = "so good"
>>>>>>> origin/main
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        attribute()
        add()
        layout()
    }
    
    private func attribute() {
        self.backgroundColor = .white
    }
    
    private func add() {
        [
            label
        ].forEach{ self.addSubview($0) }
    }
    
    private func layout() {
        label.snp.makeConstraints {
<<<<<<< HEAD
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(200)
            $0.centerX.equalToSuperview()
=======
            $0.center.equalToSuperview()
>>>>>>> origin/main
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
