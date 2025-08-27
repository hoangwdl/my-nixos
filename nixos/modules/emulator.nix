{ pkgs, ... }: {
  programs.virt-manager.enable = true;
  
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };
  
  # Networking configuration for libvirt
  networking = {
    firewall = {
      enable = true;
      # Trust the libvirt bridge interface
      trustedInterfaces = [ "virbr0" ];
      
      # Add libvirt-specific firewall rules
      extraCommands = ''
        # Allow forwarding between bridge interfaces
        iptables -I FORWARD -i virbr0 -o virbr0 -j ACCEPT
        # Allow forwarding from bridge to other interfaces
        iptables -I FORWARD -i virbr0 -j ACCEPT  
        # Allow forwarding to bridge from other interfaces
        iptables -I FORWARD -o virbr0 -j ACCEPT
        
        # Enable NAT for libvirt network
        iptables -t nat -I POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -j MASQUERADE
        
        # Allow DHCP traffic to bridge
        iptables -I INPUT -i virbr0 -p udp --dport 67 -j ACCEPT
        # Allow DNS traffic to bridge (UDP)
        iptables -I INPUT -i virbr0 -p udp --dport 53 -j ACCEPT
        # Allow DNS traffic to bridge (TCP)
        iptables -I INPUT -i virbr0 -p tcp --dport 53 -j ACCEPT
      '';
      
      # Clean up rules on firewall restart
      extraStopCommands = ''
        # Remove the rules we added (they'll be re-added on start)
        iptables -D FORWARD -i virbr0 -o virbr0 -j ACCEPT 2>/dev/null || true
        iptables -D FORWARD -i virbr0 -j ACCEPT 2>/dev/null || true
        iptables -D FORWARD -o virbr0 -j ACCEPT 2>/dev/null || true
        iptables -t nat -D POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -j MASQUERADE 2>/dev/null || true
        iptables -D INPUT -i virbr0 -p udp --dport 67 -j ACCEPT 2>/dev/null || true
        iptables -D INPUT -i virbr0 -p udp --dport 53 -j ACCEPT 2>/dev/null || true
        iptables -D INPUT -i virbr0 -p tcp --dport 53 -j ACCEPT 2>/dev/null || true
      '';
    };
    
    # Disable reverse path filtering which can interfere with libvirt
    firewall.checkReversePath = false;
  };
  
  systemd.tmpfiles.rules = [ 
    "L+ /var/lib/qemu/firmware - - - - *${pkgs.qemu}*/share/qemu/firmware" 
  ];
}