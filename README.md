# HUDamination
HUD 自定义动画
```javascript
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

```

