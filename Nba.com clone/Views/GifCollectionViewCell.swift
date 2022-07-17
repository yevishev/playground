//
//  GifCollectionViewCell.swift
//  Nba.com clone
//
//  Created by oberoya on 14/07/2022.
//

import UIKit

class GifCollectionViewCell: UICollectionViewCell {
    
    //в свойство записываю объект label
    weak var textLabel: UILabel!
    
    //переписываю конструктор
    override init(frame: CGRect) {
        super.init(frame: frame)
        //создаю константу объекта UILabel
        let textLabel = UILabel(frame: .init(x: 10, y: 40, width: 100, height: 20))
        //как я понял, данное свойство нужно ставить в true тогда, когда необходимо сохранить пропорции при изменении соотношений сторон, а в родителе ставить false, чтобы констрейнты данного элементы легли в основу размеров ячейки
        textLabel.translatesAutoresizingMaskIntoConstraints = true
        //добавляю на экран въюху
        self.contentView.addSubview(textLabel)
        //устанавливаю для него ограничения(constraits) в ячейке
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
        self.contentView.backgroundColor = .systemGray
        self.textLabel = textLabel
        self.textLabel.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("IB is not supported")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fatalError("IB is not supported")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.textLabel.text = nil
    }

}
