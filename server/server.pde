import processing.net.*;

final int network_port = 50000;
final int room_max = 2;
final int room_player_max = 1;
final int screen_width = 400;
final int screen_height = 400;

Server server;
int[][][] network_data = new int[room_max][room_player_max][2];

void setup()
{
  size(400, 400);
  background(0);
  
  server = new Server(this, network_port);
}

void draw()
{
  for (int i = 0; i < room_max; i++)
  {
    for (int j = 0; j < room_player_max; j++)
    {
      if (network_data[i][j][0] == 1)
      {
        fill(0, 255, 0);
        rect(j * screen_width / room_player_max,
          i * screen_height / room_max,
          screen_width / room_player_max,
          screen_height / room_max);
      }
    }
  }
}

void serverEvent(Server sv, Client cl)
{
  int roomID = 0;
  int playerID = 0;
  boolean roomAccept = false;
  
  for (int i = 0; i < room_max; i++)
  {
    if (roomAccept) break;
    for (int j = 0; j < room_player_max; j++)
    {
      if (roomAccept) break;
      if (network_data[i][j][1] == 0)
      {
        roomID = i;
        playerID = j;
        roomAccept = true;
      }
    }
  }
  
  if (roomAccept)
  {
    network_data[roomID][playerID][0] = 1;
    network_data[roomID][playerID][1] = 1;
  }
  else
  {
    
  }
}

void disconnectEvent(Client cl)
{
  
}
