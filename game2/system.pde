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

public class Raycast
{
  private float inc = 0; //傾き
  
  //ターゲット
  public Raycast(Vector target)
  {
    
  }
  
  public void raycast()
  {
    Vector2 ray = new Vector2(mouseX - playerX, mouseY - playerY); //方向ベクトル
    if (ray.x == 0) inc = 99999;
    else inc = ray.y / ray.x;
  }
  
  public void render()
  {
    line(0, inc * (0 - playerX) + playerY, width, inc * (width - playerX) + playerY);
  }
}
