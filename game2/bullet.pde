//インスタンス
ArrayList<Bullet> bullet = new ArrayList<Bullet>();

//クラス
public class Bullet
{
  private final float _size = 10; //サイズ
  private final float _speed = 10; //弾速
  
  private Vector2 _pos = new Vector2(0, 0);//座標
  private Vector2 _dir = new Vector2(0, 0); //向き
  private int _type = 0; //弾の種類
  
  //初期化
  public Bullet(int type, float px, float py, float tox, float toy)
  {
    _type = type;
    _pos = new Vector2(px, py);
    _dir = new Vector2(tox - px, toy - py);
    _dir.Normalize(_speed);
  }
  
  //動作
  public void move()
  {
    //弾移動
    _pos.Add(_dir);
  }
  
  //消去
  public boolean destroy()
  {
    //描画外判定
    if (_pos.x < 0 || _pos.x > width
      || _pos.y < 0 || _pos.y > height)
    {
      return true;
    }
    
    return false;
  }
  
  //描画
  public void render()
  {
    if (_type == 0) fill(0, 0, 255);
    else if (_type == 1) fill(255, 0, 0);
    
    ellipse(_pos.x, _pos.y, _size, _size);
  }
}
