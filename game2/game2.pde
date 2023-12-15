//定義
final float width = 960;
final float height = 720;
final float infinity = 99999; //極限
final int ray_max = 1;

//インスタンス
Input input = new Input();
Player player = new Player(width / 2, height / 2);
ArrayList<Ray> ray0 = new ArrayList<Ray>(); //青弾のレイ
ArrayList<Ray> ray1 = new ArrayList<Ray>(); //赤弾のレイ
ArrayList<Bullet> bullet = new ArrayList<Bullet>();
ArrayList<Enemy> enemy = new ArrayList<Enemy>();

//変数
PImage img_satoru;
PImage img_tokupon;
Vector2 playerPos = new Vector2(0, 0);

void setup()
{
  //初期設定
  size(960, 720);
  frameRate(60);
  
  //レイ初期設定
  for (int i = 0; i < ray_max; i++)
  {
    ray0.add(new Ray(new Vector2(width / 2 - 25, height / 2 + 20),
      new Vector2(mouseX, mouseY)));
    ray1.add(new Ray(new Vector2(width / 2 + 25, height / 2 + 20),
      new Vector2(mouseX, mouseY)));
  }
  
  //enemy.add(new Enemy(0, 0));
  
  //画像
  img_satoru = loadImage("image/satoru.png");
  img_tokupon = loadImage("image/tokupon.jpg");
}

void draw()
{
  system();
  render();
}

void system()
{
  //プレイヤー
  player.move();
  player.attack();
  
  //弾
  for(int i = 0; i < bullet.size(); i++)
  {
    bullet.get(i).move();
    if (bullet.get(i).destroy()) bullet.remove(i);
  }
  
  if (frameCount % 60 == 0) enemy.add(new Enemy(100, 100));
  
  //敵
  for (int i = 0; i < enemy.size(); i++)
  {
    enemy.get(i).move();
    enemy.get(i).collider();
    if (enemy.get(i).destroy()) enemy.remove(i);
  }
  
  //レイ
  ray0.remove(0);
  ray0.add(new Ray(new Vector2(playerPos.x - 25, playerPos.y + 20),
    new Vector2(mouseX, mouseY)));
  ray1.remove(0);
  ray1.add(new Ray(new Vector2(playerPos.x + 25, playerPos.y + 20),
    new Vector2(mouseX, mouseY)));
}

void render()
{
  background(255);
  
  //プレイヤー
  player.render();
  
  //弾
  for (int i = 0; i < bullet.size(); i++)
    bullet.get(i).render();
  
  //敵
  for (int i = 0; i < enemy.size(); i++)
    enemy.get(i).render();
  
  //レイ：デバッグ
  for (int i = 0; i < ray_max; i++)
  {
    //ray0.get(i).debug();
    ray1.get(i).debug();
  }
}
