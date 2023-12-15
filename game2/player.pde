//クラス
public class Player
{
  //プレイヤー
  private Vector2 _size = new Vector2(50, 100); //サイズ
  private Vector2 _pos = new Vector2(0, 0); //座標
  private float _speed = 2; //速度
  
  //プレイヤーUI
  private float _angle = 0; //ラジアン
  private float _angle2 = 180;
  private final float _radius = 60;
  
  //弾
  private final float _bulletSize = 20; //弾サイズ
  private final int _interval = 10;
  
  //初期化
  public Player(float px, float py)
  { 
    _pos.x = px;
    _pos.y = py;
  }
  
  //動作
  public void move()
  {
    //入力
    int ix = 0, iy = 0;
    float correction = 1;
    if (input.up() && _pos.y - _size.y / 2 > 0) iy -= 1;
    if (input.down() && _pos.y + _size.y / 2 < height) iy += 1;
    if (input.left() && _pos.x - _size.x / 2 > 0) ix -= 1;
    if (input.right() && _pos.x + _size.x / 2 < width) ix += 1;
    
    //角度補正
    Vector2 direction = new Vector2(ix, iy);
    if (direction.Magnitude() > 1) correction = 0.7;
    
    //ベクトル計算
    _pos.x += ix * _speed * correction;
    _pos.y += iy * _speed * correction;
    playerPos = new Vector2(_pos.x, _pos.y);
  }
  
  //弾発射
  public void attack()
  {
    //青弾
    if (input.action0())
    {
      if (frameCount % _interval == 0)
      {
        bullet.add(new Bullet(0, _pos.x - 25, _pos.y + 20, mouseX, mouseY));
      }
    }

    //赤弾
    if (input.action1())
    {
      if (frameCount % _interval == 0)
      {
        bullet.add(new Bullet(1, _pos.x + 25, _pos.y + 20, mouseX, mouseY));
      }
    }
  }
  
  //描画
  public void render()
  {
    //ユニット
    image(img_satoru, _pos.x - _size.x / 2, _pos.y - _size.y / 2, _size.x, _size.y);
    
    //UI
    _angle += 1;
    _angle2 += 1;
    if (_angle >= 360) _angle = 0;
    if (_angle2 >= 360) _angle2 = 0;
    
    float radian = _angle * PI / 180;
    float radian2 = _angle2 * PI / 180;
    
    //青
    fill(0, 0, 255);
    ellipse(_pos.x + cos(radian) * _radius,
      _pos.y + sin(radian) * _radius,
      _bulletSize, _bulletSize);
    
    //赤
    fill(255, 0, 0);
    ellipse(_pos.x + cos(radian2) * _radius,
      _pos.y + sin(radian2) * _radius,
      _bulletSize, _bulletSize);
  }
}
