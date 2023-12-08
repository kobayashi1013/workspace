//定義
final float width = 960;
final float height = 720;

//インスタンス
Input input = new Input();
Player player = new Player(width / 2, height - 80, 80, 160);
Ball ball = new Ball(width / 2, 200, 80, 80);

//変数
PImage img_satoru;

void setup()
{
  //初期設定
  size(960, 720);
  frameRate(60);
  
  //画像読み出し
  img_satoru = loadImage("image/satoru.png");
}

void InitWindow()
{
  background(255);
}

void draw()
{
  InitWindow();
  
  player.move();
  player.render();
  
  ball.move();
  ball.render();
}
