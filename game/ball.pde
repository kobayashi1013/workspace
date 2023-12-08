//クラス
public class Ball extends Rigidbody
{
  public Ball(float px, float py, float sx, float sy)
  {
    _px = px;
    _py = py;
    _sx = sx;
    _sy = sy;
  }
  
  public void move()
  {
    gravity();
    collider(player);
  }
  
  public void render()
  {
    fill(255, 0, 0);
    ellipse(_px, _py, _sx, _sy);
  }
}
