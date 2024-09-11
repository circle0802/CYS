import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo+Text")
    }

    private let detailLabel = UILabel().then {
        $0.text = "DSM 학교장 인증제 점수를 확인하고,\n관리해보세요!"
        $0.font = .systemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    let startButton = CYSButton(type: .start)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        add()
        layout()
    }
    
    private func attribute() {
        view.backgroundColor = .white
        startButton.button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    private func add() {
        [
            logoImage,
            detailLabel,
            startButton
        ].forEach{ view.addSubview($0) }
    }
    private func layout() {
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(115)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(100)
            $0.width.equalTo(260)
        }
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        startButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(56)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(70)
        }
    }

    @objc private func startButtonTapped() {
        print("start버튼 클릭됨")
    }
}


