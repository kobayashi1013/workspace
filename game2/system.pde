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

public static class Raycast
{
  public static void raycast()
  {
    Vector2 ray = new Vector2(mouseX - playerX, mouseY - playerY); //方向ベクトル
    float inc = 0; //傾き
    if (ray.x == 0) inc = 99999;
    else inc = ray.y / ray.x;
  }
  
  public static void render()
  {
    //line(playerX + (width - playerY) / inc, inc(0 - playerX) + playerY,
  }
}
