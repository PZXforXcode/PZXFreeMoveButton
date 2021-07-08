# PZXFreeMoveButton
在屏幕上 自由拖动的悬浮按钮，会自己吸附到边缘
支持Swift版本，特别鸣谢 @Mvp丶俊奕
## 查看效果
![悬浮按钮.gif](https://upload-images.jianshu.io/upload_images/19409325-2c7827ed0e35b76e.gif?imageMogr2/auto-orient/strip)

## 使用方法
将PZXFreeMoveButtonControl 文件夹放入你的代码中
在需要的页面 #import "PZXFreeMoveButtonControl.h"

## 具体代码
```
    PZXFreeMoveButton *button = [[PZXFreeMoveButton alloc]initWithFrame:CGRectMake(0,200, 60, 60)];
    button.backgroundColor = [UIColor cyanColor];
//    button
    button.titleLabel.text = @"点击";
    [button setActionBlock:^{
        
        NSLog(@"tap");
        
    }];
    [self.view addSubview:button];
    //------Swift使用方法--------
        let freeButton = PZXFreeMoveButton.init(frame: CGRect.init(x: 0, y: 200, width: 60, height: 60))
        freeButton.backgroundColor = .cyan
        freeButton.titleLabel.text = "点击"
        freeButton.setActionBlock {
            print("tap")
        }
        self.view.addSubview(freeButton)
```


