import UIKit
import SnapKit
import Then

class QuestionCell: UICollectionViewCell {
    
    static let identifier = "QuestionCell"
    
    private let label = UILabel().then {
        $0.text = "so good"
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
            $0.center.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
