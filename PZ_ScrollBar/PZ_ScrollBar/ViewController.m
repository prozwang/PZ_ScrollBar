//
//  ViewController.m
//  PZ_ScrollBar
//
//  Created by ProZ on 16/8/23.
//  Copyright © 2016年 ProZ. All rights reserved.
//

#import "ViewController.h"
#import "PZScrollBar.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UIScrollViewDelegate>{
    PZScrollView *_sliderBar;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];


    _sliderBar = [[PZScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 64)];
    _sliderBar.sliderColor = [UIColor blueColor];
    _sliderBar.isDevice = YES;
    [self.view addSubview:_sliderBar];


    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake( 0, 64,  SCREENWIDTH,  SCREENHEIGHT - 64)];
    scrollView.contentSize = CGSizeMake( SCREENWIDTH * 3, 0);
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];


    __weak typeof(self) weakSelf = self;

    
    PZButtonInfo *button1 = [PZButtonInfo creatBtnInfoWithTitle:@"first" block:^{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{

            UIViewController *firstVC = [[UIViewController alloc] init];
            firstVC.view.backgroundColor = [UIColor redColor];
            firstVC.view.frame = scrollView.bounds;
            [weakSelf addChildViewController:firstVC];
            [scrollView addSubview:firstVC.view];
        });

    }];

    PZButtonInfo *button2 = [PZButtonInfo creatBtnInfoWithTitle:@"second" block:^{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{

            UIViewController *secondVC = [[UIViewController alloc] init];
            secondVC.view.backgroundColor = [UIColor orangeColor];
            secondVC.view.frame = scrollView.bounds;
            [weakSelf addChildViewController:secondVC];
            [scrollView addSubview:secondVC.view];
        });
    }];

    PZButtonInfo *button3 = [PZButtonInfo creatBtnInfoWithTitle:@"third" block:^{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{

            UIViewController *thirdVC = [[UIViewController alloc] init];
            thirdVC.view.backgroundColor = [UIColor greenColor];
            thirdVC.view.frame = scrollView.bounds;
            [weakSelf addChildViewController:thirdVC];
            [scrollView addSubview:thirdVC.view];
        });
    }];


    _sliderBar.btnInfos = @[button1,button2,button3];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    int offsetIndex = scrollView.contentOffset.x / SCREENWIDTH;

    _sliderBar.selectedIdx = offsetIndex;

}

@end
