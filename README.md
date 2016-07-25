# HUDamination
HUD 自定义动画
1.  MBProgressHUD*hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
2.  hud.mode=MBProgressHUDModeCustomView;
3.  UIImageView *imageView = [[UIImageView alloc] init];
4.
5.  //创建一个数组，数组中按顺序添加要播放的图片（图片为静态的图片）
6.  NSMutableArray *imgArray = [NSMutableArray array];
7.  for (int i=1; i<4; i++) {
8.  UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%d.png",i]];
9.  [imgArray addObject:image];
10.  }
11.  //把存有UIImage的数组赋给动画图片数组
12.  imageView.animationImages = imgArray;
13.  //设置执行一次完整动画的时长
14.  imageView.animationDuration = 3*0.15;
15.  //动画重复次数 （0为重复播放）
16.  imageView.animationRepeatCount = 0;
17.  //开始播放动画
18.  //    hud.bezelView.backgroundColor=[UIColor clearColor];
19.  [imageView startAnimating];
20.  //    hud.margin=0;
21.  //    hud.label.backgroundColor=[UIColor clearColor];
22.  hud.customView=imageView;
23.  hud.label.text=@"heheda";
