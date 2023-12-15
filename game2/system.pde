//ベクトル
public class Vector2
{
  public float x = 0;
  public float y = 0;
  
  public Vector2(float ix, float iy)
  {
    x = ix;
    y = iy;
  }
  
  public float Magnitude()
  {
    return sqrt(pow(x, 2) + pow(y, 2));
  }
  
  public float Distance(Vector2 target)
  {
    return sqrt(pow(target.x - x, 2) + pow(target.y - y, 2));
  }
  
  public void Add(Vector2 target)
  {
    x += target.x;
    y += target.y;
  }
  
  public void Normalize(float bias)
  {
    float mag = Magnitude();
    x = x / mag * bias;
    y = y / mag * bias;
  }
}

//レイ

public class Ray
{
  private final float limit = 10; //閾値
  
  private float _inc = 0; //傾き
  private Vector2 _be = new Vector2(0, 0); //開始地点
  
  public Ray(Vector2 be, Vector2 to)
  {
    //初期設定
    _be = new Vector2(be.x, be.y);
    
    //ベクトル計算
    Vector2 dir = new Vector2(to.x - be.x, to.y - be.y); //方向ベクトル
    
    //傾き計算
    if (dir.x == 0) _inc = infinity; //極限
    else _inc = dir.y / dir.x;
  }
  
  public boolean cast(Vector2 target)
  {
    //座標計算
    float x = _be.x + (target.y - _be.y) / _inc;
    float y = _inc * (target.x - _be.x) + _be.y;
    
    //衝突判定
    if (target.x > x - limit
      && target.x < x + limit
      && target.y > y - limit
      && target.y < y + limit)
      return true;
    
    return false;
  }
  
  public void debug()
  {
    //デバッグ
    line(0, _inc * (0 - _be.x) + _be.y, width, _inc * (width - _be.x) + _be.y);
  }
}
