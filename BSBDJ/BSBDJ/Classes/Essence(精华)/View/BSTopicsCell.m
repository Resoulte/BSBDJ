//
//  BSTopicsCell.m
//  BSBDJ
//
//  Created by ma c on 16/9/10.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSTopicsCell.h"
#import "BSTopicsItem.h"
#import "BSTopicsImageView.m"

@interface BSTopicsCell ()

/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
/** 昵称 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;
/** 顶 */
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
/** 踩 */
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
/** 分享 */
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
/** 评论 */
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
/**v标识*/
@property (weak, nonatomic) IBOutlet UIImageView *sina_v;

@property (weak, nonatomic) IBOutlet UILabel *text_lable;

/** 图片帖子中间的内容 */
@property (nonatomic, weak) BSTopicsImageView *pictureView;


@end

@implementation BSTopicsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIImageView *backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    self.backgroundView = backView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 重写frame
- (void)setFrame:(CGRect)frame {

    
    frame.origin.x = SFTopicCellMargin;
    frame.size.width -= 2 *SFTopicCellMargin;
    frame.size.height -= SFTopicCellMargin;
    frame.origin.y += SFTopicCellMargin;
    
    [super setFrame:frame];
}

/**
 今年
    今天
        1分钟内
        刚刚
    1小时内
        xx分钟前
    其他
        xx小时前
    昨天
        昨天 18:56:34
    其他
        06-23 19:56:23
 
 非今年
    2014-05-08 18:45:30
 */


#pragma mark - setter and getter
- (void)setTopicsItem:(BSTopicsItem *)topicsItem {
    _topicsItem = topicsItem;
    
    self.sina_v.hidden = !topicsItem.sina_v;
    
    // 设置其他控件
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topicsItem.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = topicsItem.name;
    
    self.createTimeLabel.text = topicsItem.create_time;
    
    [self setupButtonTitle:self.dingButton count:topicsItem.ding placeholder:@"顶"];
    [self setupButtonTitle:self.caiButton count:topicsItem.cai placeholder:@"踩"];
    [self setupButtonTitle:self.shareButton count:topicsItem.repost placeholder:@"分享"];
    [self setupButtonTitle:self.commentButton count:topicsItem.comment placeholder:@"评论"];
    
    // 设置文字
    self.text_lable.text = topicsItem.text;
    
    // 根据模型数据添加相应的内容到cell上
    if (topicsItem.type == SFTopicTypeImage) { // 图片帖子
        self.pictureView.topicItem = topicsItem;
        
    }
}

- (void)setupButtonTitle:(UIButton *)button count:(NSInteger)count placeholder:(NSString *)placeholder
{
    //    NSString *title = nil;
    //    if (count == 0) {
    //        title = placeholder;
    //    } else if (count > 10000) {
    //        title = [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    //    } else {
    //        title = [NSString stringWithFormat:@"%zd", count];
    //    }
    if (count > 10000) {
        placeholder = [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    } else if (count > 0) {
        placeholder = [NSString stringWithFormat:@"%zd", count];
    }
    [button setTitle:placeholder forState:UIControlStateNormal];
}

- (BSTopicsImageView *)pictureView {
    if (!_pictureView) {
        _pictureView = [BSTopicsImageView pictureView];
        [self.contentView addSubview:self.pictureView];
    }
    
    return _pictureView;
}

@end
