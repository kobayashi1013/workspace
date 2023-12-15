//クラス
public class Enemy
{
  private final float _speed = 1; //スピード
  private final float _playerDistance = 60; //プレイヤーとの距離
  
  private Vector2 _size = new Vector2(50, 80); //サイズ
  private Vector2 _pos = new Vector2(0, 0); //座標
  private Vector2 _dir = new Vector2(0, 0); //向き
  private boolean _active = true; //有効
  
  //初期化
  public Enemy(float px, float py)
  {
    _pos = new Vector2(px, py);
  }
  
  //動作
  public void move()
  {
    //ベクトル計算
    _dir = new Vector2(playerPos.x - _pos.x, playerPos.y - _pos.y);
    _dir.Normalize(_speed);
    _pos.Add(_dir);
  }

  //衝突
  public void collider()
  {
    //プレイヤーとの衝突
    if (_pos.Distance(playerPos) < _playerDistance)
    {
      _active = false;
    }
    
    //弾との衝突
    for (int i = 0; i < ray_max; i++)
    {
      if (ray1.get(i).cast(_pos))
      {
        _active = false;
      }
    }
  }
  
  //削除
  public boolean destroy() { return !_active; }
  
  //描画
  public void render()
  {
    //ユニット
    image(img_tokupon, _pos.x - _size.x / 2, _pos.y - _size.y / 2, _size.x, _size.y);
  }
}
