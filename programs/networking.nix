{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    aria2
    dnsutils
    ipcalc
    iperf3
    ktailctl
    ldns
    mtr
    nmap
    socat
    tailscale
  ];
}
