//インスタンス
Input input = new Input();

//クラス
public class Input
{
  private boolean _up; //移動
  private boolean _down;
  private boolean _left;
  private boolean _right;
  private boolean _action0; //青
  private boolean _action1; //赤
  
  public void up(boolean value) { _up = value; }
  public boolean up() { return _up; }
  public void down(boolean value) { _down = value; }
  public boolean down() { return _down; }
  public void left(boolean value) { _left = value; }
  public boolean left() { return _left; }
  public void right(boolean value) { _right = value; }
  public boolean right() { return _right; }
  public void action0(boolean value) { _action0 = value; }
  public boolean action0() { return _action0; }
  public void action1(boolean value) { _action1 = value; }
  public boolean action1() { return _action1; }
}

void keyPressed()
{
  if (key == 'w') input.up(true);
  else if (key == 's') input.down(true);
  else if (key == 'a') input.left(true);
  else if (key == 'd') input.right(true);
}

void keyReleased()
{
  if (key == 'w') input.up(false);
  else if (key == 's') input.down(false);
  else if (key == 'a') input.left(false);
  else if (key == 'd') input.right(false);
}

void mousePressed()
{
  if (mouseButton == LEFT) input.action0(true);
  else if (mouseButton == RIGHT) input.action1(true);
}

void mouseReleased()
{
  if (mouseButton == LEFT) input.action0(false);
  else if (mouseButton == RIGHT) input.action1(false);
}
