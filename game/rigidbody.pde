//クラス
public class Rigidbody
{
  public float _sx = 0;
  public float _sy = 0;
  public float _px = 0;
  public float _py = 0;
  
  private float _vx = 0;
  private float _vy = 0;
  private float _gravity = 0.2;
  private float _repulsion = 1.016;
  private boolean colliderTrigger = false;
  
  //重力
  public void gravity()
  {
    _vy += _gravity; //速度
    _py += _vy; //位置
  }
  
  //コライダー衝突
  public boolean collider(Rigidbody rbody)
  {
    if (_px >= rbody._px - rbody._sx / 2
      && _px <= rbody._px + rbody._sx / 2
      && _py + _sy / 2 >= rbody._py - rbody._sy / 2
      && _py + _sy / 2 <= rbody._py - rbody._sy / 2 + 20)
    {
      if (!colliderTrigger)
      {
        colliderTrigger = true;
          
        //衝突
        _vy = -1 * _repulsion * _vy;
          
        return true;
      }
    }
    else
    {
      colliderTrigger = false;
    }
    
    return false;
  }
}
