import UIKit
import SnapKit
import Then

class QuestionCell: UICollectionViewCell {
    
    static let identifier = "QuestionCell"
    
    public let label = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 25)
        $0.textAlignment = .center
        $0.numberOfLines = 0
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
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(200)
            $0.centerX.equalToSuperview()
            $0.center.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
