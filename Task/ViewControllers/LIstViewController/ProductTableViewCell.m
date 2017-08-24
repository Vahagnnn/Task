//
//  ProductTableViewCell.h
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "ProductTableViewCell.h"

@implementation ProductTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)displayImage:(UIImage *)image {
    self.iconImageView.image = image;
}

- (void)displayName:(NSString *)name {
    self.nameLbl.text = name;
}

- (void)displayCategory:(NSString *)category {
    self.categoryLbl.text = category;
}

- (void)displayPrice:(NSString *)price {
    self.priceLbl.text = price;
}

@end
