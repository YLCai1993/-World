//
//  PlayMuiscView.m
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PlayMuiscView.h"

@implementation PlayMuiscView

+ (PlayMuiscView *)sharedInstance{
    static PlayMuiscView *p = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        p = [PlayMuiscView new];
    });
    return p;
}
- (id)init{
    if (self = [super init]) {
        self.playBtn.hidden = NO;
    }
    return self;
}

- (UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn =[UIButton buttonWithType:0];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"libao"] forState:UIControlStateNormal];
        [self addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _playBtn.tag = 10;
    }
    return _playBtn;
}

-(void)playerWithURl:(NSURL *)musicURL{
    //设置支持的类别
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    //激活
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    _player =[AVPlayer playerWithURL:musicURL];
    [_player play];
    self.playBtn.selected = YES;
}


@end
