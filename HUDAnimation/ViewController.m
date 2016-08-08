//
//  ViewController.m
//  HUDAnimation
//
//  Created by jarvis jiang on 16/7/19.
//  Copyright © 2016年 jarvis jiang. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
{
    AVPlayerViewController*_playerVC;
    AVPlayer*_player;
    AVAudioSession*_session;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MBProgressHUD*hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode=MBProgressHUDModeCustomView;
    UIImageView *imageView = [[UIImageView alloc] init];

    //创建一个数组，数组中按顺序添加要播放的图片（图片为静态的图片）
    NSMutableArray *imgArray = [NSMutableArray array];
    for (int i=1; i<4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%d.png",i]];
        [imgArray addObject:image];
    }
    //把存有UIImage的数组赋给动画图片数组
    imageView.animationImages = imgArray;
    //设置执行一次完整动画的时长
    imageView.animationDuration = 3*0.15;
    //动画重复次数 （0为重复播放）
    imageView.animationRepeatCount = 0;
    //开始播放动画
//    hud.bezelView.backgroundColor=[UIColor clearColor];
    [imageView startAnimating];
//    hud.margin=0;
//    hud.label.backgroundColor=[UIColor clearColor];
    hud.customView=imageView;
    hud.label.text=@"heheda";
    [hud hideAnimated:YES afterDelay:2];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self initPlayer];
    });
//    [NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playerControllerDone) name:<#(nullable NSString *)#> object:<#(nullable id)#>
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnCLick:(id)sender {
    
    [self initPlayer];
}

-(void)initPlayer
{
//    _session=[AVAudioSession sharedInstance];
//    [_session setCategory:AVAudioSessionCategoryPlayback error:nil];
    NSString*path=[[NSBundle mainBundle]pathForResource:@"temp" ofType:@".mov"];
    NSURL*url=[NSURL fileURLWithPath:path];
    _player=[AVPlayer playerWithURL:url];
    _playerVC=[[AVPlayerViewController alloc]init];
    _playerVC.player=_player;
    _playerVC.videoGravity=AVLayerVideoGravityResizeAspect;
    _playerVC.showsPlaybackControls = true;
    [self presentViewController:_playerVC animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
