final float width = 960;
final float height = 720;

PImage img_satoru;
PImage img_tokupon;

float playerX = 0;
float playerY = 0;

void setup()
{
  //初期設定
  size(960, 720);
  frameRate(60);
  
  //画像
  img_satoru = loadImage("image/satoru.png");
  img_tokupon = loadImage("image/tokupon.jpg");
}

void initWindow()
{
  background(255);
}

void draw()
{
  initWindow();
  
  if (frameCount % 60 == 0) enemy.add(new Enemy(300, 300));
  
  //敵
  for (int i = 0; i < enemy.size(); i++)
  {
    enemy.get(i).move();
    enemy.get(i).render();
    if (enemy.get(i).destroy()) enemy.remove(i);
  }
  
  //プレイヤー
  player.move();
  player.attack();
  player.render();
  
  //弾
  for(int i = 0; i < bullet.size(); i++)
  {
    bullet.get(i).move();
    bullet.get(i).render();
    if (bullet.get(i).destroy()) bullet.remove(i);
  }
}
