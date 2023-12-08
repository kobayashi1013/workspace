//クラス
public class Player extends Rigidbody
{
  private final float _speed = 5;
  
  public Player(float px, float py, float sx, float sy)
  {
    _px = px;
    _py = py;
    _sx = sx;
    _sy = sy;
  }
  
  public void move()
  {
    //移動
    if (input.left() && _px > _sx / 2)
      _px -= _speed;
    if (input.right() && _px < width - _sx / 2)
      _px += _speed;
  }
  
  public void render()
  {
    //fill(0, 0, 255);
    //ellipse(_px, _py, _sy, _sy);
    image(img_satoru, _px - _sx / 2, _py - _sy / 2, _sx, _sy);
  }
}
