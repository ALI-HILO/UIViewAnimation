//
//  ViewController.m
//  UIViewAnimation
//
//  Created by Fogao Zhang on 16/7/22.
//  Copyright © 2016年 Fogao Zhang. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ZRCategory.h"

#define  SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width

#define  SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *BGView;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;

@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (weak, nonatomic) IBOutlet UIButton *centerBtn;


@end



@implementation ViewController
{
    CGPoint _center;
    UIButton *_theCenterBtn;
}
//- (void)loadView{
//    
//    [super loadView];
//    
//    UIView *vie = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 330, 500)];
//    vie.backgroundColor = [ UIColor orangeColor];
//    [self.view addSubview:vie];
//    
//    self.leftBtn.frame = CGRectMake(10, 400, 300, 200);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _center = self.centerBtn.center;
    _theCenterBtn = self.centerBtn;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)leftBtnAction:(id)sender {

    [self setTheFrame:(UIButton *)sender];
    
}
- (IBAction)rightBtnAction:(id)sender {
    
    [self setTheFrame:(UIButton *)sender];
    
}
- (IBAction)centerBtnAction:(id)sender {
    
    [self setTheFrame:(UIButton *)sender];
}

/**
 *  先判断该button是否在上一栏
 *
 *  @param btn 点中的button
 */
- (void)setTheFrame:(UIButton *)btn{
    
    if( btn.centerX == _center.x && btn.centerY == _center.y) {
        /**
         *   当前center在上一栏的时候  判断当前center  是否在上面一栏的中心 是的话 就滑到最左边
         */
        [UIView animateWithDuration:0.5 animations:^{
            
            btn.x = SCREEN_WIDTH - self.BGView.width - btn.width-10;
            self.BGView.x =  SCREEN_WIDTH - self.BGView.width;
            _theCenterBtn = btn;
        }];
        return;
    }
    if( btn.centerX != _center.x && btn.centerY == _center.y) {
        /**
         * 当前center在上一栏的时候  判断当前center  是否在上面一栏的中心 不是的话 就滑到中间
         */
        [UIView animateWithDuration:0.5 animations:^{
            
            btn.center =  _center;
            self.BGView.x =  SCREEN_WIDTH;
            _theCenterBtn = btn;
        }];
        return ;
    }
    
    [self setTheMainBtnFrame:_theCenterBtn withWillBeCenterBtn:btn];
    
}
/**
 *  设置选中 button 动画移到上一栏最左边
 *
 *  @param centerBtn   当前上一栏的button
 *  @param beCenterBtn  点击的button
 */
- (void)setTheMainBtnFrame:(UIButton *)centerBtn withWillBeCenterBtn:(UIButton *)beCenterBtn {
    
    [UIView animateWithDuration:0.5 animations:^{
        /**
         *  先将滑到左边的button 回到中心位置  那块view也藏起来
         */
        centerBtn.center =  _center;
        self.BGView.x =  SCREEN_WIDTH;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            /**
             *  完成以后  交换当前点中的button 和 在中间的button的位置
             */
            centerBtn.center = beCenterBtn.center;
            beCenterBtn.center = _center;
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.5 animations:^{
                
                /**
                 *  交换两个button位置以后  再将那块view和buutton一起平移到左边
                 */
                beCenterBtn.x = SCREEN_WIDTH - self.BGView.width - centerBtn.width-10;
                self.BGView.x =  SCREEN_WIDTH - self.BGView.width;
                 _theCenterBtn = beCenterBtn;   // 记录下当前中心的button
                
            }];
            
        }];
    }];
}
@end
