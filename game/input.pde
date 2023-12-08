//クラス
public class Input
{
  public boolean _left;
  public boolean _right;
  public boolean _jump;
  
  public void left(boolean value) { _left = value; }
  public boolean left() { return _left; }
  public void right(boolean value) { _right = value; }
  public boolean right() { return _right; }
  public void jump(boolean value) { _jump = value; }
  public boolean jump() {return _jump; }
}

void keyPressed()
{
  if (key == 'a') input.left(true);
  else if (key == 'd') input.right(true);
  else if (key == ' ') input.jump(true);
}

void keyReleased()
{
  if (key == 'a') input.left(false);
  else if (key == 'd') input.right(false);
  else if (key == ' ') input.jump(false);
}
