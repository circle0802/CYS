import UIKit
import SnapKit
import Then

enum BTTpye {
    case start
    case next
    var text: String {
        switch self {
        case .start:
            return "START"
        case .next:
            return "NEXT"
        }
    }
}

class CYSButton: UIView {
    let button = UIButton().then {
        $0.backgroundColor = UIColor(named: "cysColor")
    }
    let buttonLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 30, weight: .heavy)
    }
    
    init(type: BTTpye){
        super.init(frame: .zero)
        
        buttonLabel.text = type.text
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(button)
        button.addSubview(buttonLabel)
        
        button.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(0)
            $0.height.equalTo(70)
        }
        buttonLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
