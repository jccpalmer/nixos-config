{ config, pkgs, ... }:

{

  services.mpd = {
    enable = true;
    musicDirectory = "/home/jordan/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
      state_file "~/.config/mpd/state"
    '';
  };

}
