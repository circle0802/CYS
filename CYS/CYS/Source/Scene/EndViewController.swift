import UIKit
import SnapKit
import Then

class EndViewController: UIViewController {
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo+Text")
    }
    
    private let endButton = CYSButton(type: .end)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        add()
        layout()
    }
    
    private func attribute() {
        view.backgroundColor = .white
        endButton.button.addTarget(self, action: #selector(endButtonTapped), for: .touchUpInside)
        self.navigationItem.hidesBackButton = true
    }
    
    private func add() {
        [
            logoImage,
            endButton
        ].forEach{ view.addSubview($0) }
    }
    
    private func layout() {
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(115)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(100)
            $0.width.equalTo(260)
        }
        endButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(56)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(70)
        }
    }
    
    @objc private func endButtonTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
