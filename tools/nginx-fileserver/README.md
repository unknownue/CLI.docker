
Static File Server by Nginx + Docker

From https://github.com/colinwjd/aria2-ariang

See also https://www.azimiao.com/5830.html

- Install Docker
- Clone repo
    ```
    $ git clone https://github.com/colinwjd/aria2-ariang
    $ cd aria2-ariang
    ```
- Copy `launch.sh` to repo
- Modify `launch.sh`
    - Download directory
    - Password
    - etc..
- Start server
    ```
    $ bash launch.sh
    ```
- Visit site by http://your_ip:6888/ to download file from server
- Visit site by http://your_ip:6880/ to download file to server


