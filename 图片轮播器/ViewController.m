//
//  ViewController.m
//  图片轮播器
//
//  Created by 郝一鹏 on 16/3/16.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import "ViewController.h"
#define imageNumber 21

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UIImageView *centerImageView;
@property (nonatomic,strong) UIImageView *rightImageView;
@property (nonatomic,assign) int leftIndex;
@property (nonatomic,assign) int centerIndex;
@property (nonatomic,assign) int rightIndex;


@property (nonatomic,strong) UIScrollView *scV;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  添加scrollView
    [self setScrollView];
    
}

/**
 *  添加scrollView
 */
- (void)setScrollView{
    
    _leftIndex = imageNumber;
    _centerIndex = 1;
    _rightIndex = 2;
    
    
    CGRect screenRect = self.view.bounds;
    _scV = [[UIScrollView alloc] initWithFrame:screenRect];
    
    CGRect bigRect = CGRectMake(0, 0, screenRect.size.width * 3, screenRect.size.height);
    
    _scV.contentSize = bigRect.size;
    
    _leftImageView = [[UIImageView alloc] initWithFrame:screenRect];
    _centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenRect.size.width, 0, screenRect.size.width, screenRect.size.height)];
    _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenRect.size.width * 2, 0, screenRect.size.width, screenRect.size.height)];
    
    _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    _centerImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",_leftIndex]];
    _centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",_centerIndex]];
    _rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",_rightIndex]];
    
    
    [_scV addSubview:self.leftImageView];
    [_scV addSubview:self.centerImageView];
    [_scV addSubview:self.rightImageView];
    
    [_scV setContentOffset:CGPointMake(screenRect.size.width, 0)];
    
    _scV.pagingEnabled = YES;
    _scV.showsHorizontalScrollIndicator = NO;
    _scV.delegate = self;
    [self.view addSubview:_scV];
}


#pragma mark scrollView代理方法

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"滚动了--------");
    if (_scV.contentOffset.x == 0) {
        _leftIndex -= 1;
        _centerIndex -= 1;
        _rightIndex -= 1;
        if (_leftIndex == 0) {
            _leftIndex = imageNumber;
        }
        
        if (_centerIndex == 0) {
            _centerIndex = imageNumber;
        }
        
        if (_centerIndex == 0) {
            _centerIndex = imageNumber;
        }
        
    }else if (_scV.contentOffset.x == self.view.bounds.size.width * 2) {
        _leftIndex += 1;
        _centerIndex += 1;
        _rightIndex += 1;
        if (_leftIndex == imageNumber + 1) {
            _leftIndex = 1;
        }
        
        if (_centerIndex == imageNumber + 1) {
            _centerIndex = 1;
        }
        
        if (_centerIndex == imageNumber + 1) {
            _centerIndex = 1;
        }
        
    }
    
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",_leftIndex]];
    _centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",_centerIndex]];
    _rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",_rightIndex]];
    
    
    _scV.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
    
}


@end
