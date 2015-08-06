# RotationButton
登陆的一种方式，点击后，选择指示登陆，具体看效果图
这个是偶然从网上发现的一种登陆设计，也不知道是哪个APP的，看到了设计就仿作了一个。
# 用法
1. 支持自动布局，方式是storeboard上面拖拽按钮，关联customclass即可，设置按钮标题、旋转图标的颜色等，暂不支持代码方式。
2. 支持非自动布局，方式用代码，设置frame，addsubview 在视图上面。
3. 两种用法，demo里面都有相应的实现。
4. 如果自动布局，利用故事版，配置按钮颜色下图：
![](http://i3.tietuku.com/80c1873a105a503e.jpg)

5. 还需要关联 RotationButton 类中，几个约束插座对象。具体demo里面有详细的注解，就那几步而已，并不复杂。
6. 关联customclass为RotationButton类后，可以选择代理拖拽到RotationButton的控制器，也可以在控制器里，代码设置代理，
设置完成后，无需action，即可监听按钮点击事件，开始按钮自动旋转。
# 效果截图

![](http://i1.tietuku.com/7c8e9a9e0068d927.gif)
