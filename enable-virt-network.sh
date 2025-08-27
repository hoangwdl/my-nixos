# Test the rules manually first
sudo iptables -I FORWARD -i virbr0 -o virbr0 -j ACCEPT
sudo iptables -I FORWARD -i virbr0 -j ACCEPT  
sudo iptables -I FORWARD -o virbr0 -j ACCEPT
sudo iptables -t nat -I POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -j MASQUERADE
sudo iptables -I INPUT -i virbr0 -p udp --dport 67 -j ACCEPT
sudo iptables -I INPUT -i virbr0 -p udp --dport 53 -j ACCEPT
sudo iptables -I INPUT -i virbr0 -p tcp --dport 53 -j ACCEPT