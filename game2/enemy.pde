//インスタンス
ArrayList<Enemy> enemy = new ArrayList<Enemy>();

//クラス
public class Enemy
{
  private final float _speed = 1; //スピード
  private final float _playerDistance = 60; //プレイヤーとの距離
  
  private Vector2 _size = new Vector2(50, 80); //サイズ
  private Vector2 _pos = new Vector2(0, 0); //座標
  private Vector2 _dir = new Vector2(0, 0); //向き
  
  //初期化
  public Enemy(float px, float py)
  {
    _pos = new Vector2(px, py);
    _dir = new Vector2(playerX - px, playerY - py);
    _dir.Normalize(_speed);
  }
  
  //動作
  public void move()
  {
    //ベクトル計算
    _dir = new Vector2(playerX - _pos.x, playerY - _pos.y);
    _dir.Normalize(_speed);
    _pos.Add(_dir);
  }

  //削除
  public boolean destroy()
  {
    if (_pos.Distance(new Vector2(playerX, playerY)) < _playerDistance) return true;
    return false;
  }
  
  //描画
  public void render()
  {
    //ユニット
    image(img_tokupon, _pos.x - _size.x / 2, _pos.y - _size.y / 2, _size.x, _size.y);
  }
}
