{ pkgs, ...}: {
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
    extraConfig.pipewire."99-speaker-routing" = {
      "context.modules" = [{
        name = "libpipewire-module-loopback";
	args = {
	  "node.description" = "Stereo to 4.0 upmix";
	  "audio.position" = ["FL" "FR"];
	  "capture.props" = {
	    "node.name" = "sink.upmix_4_0";
	    "media.class" = "Audio/Sink";
	  };
	  "playback.props" = {
	    "node.name" = "playback.upmix_4_0";
	    "audio.position" = [ "FL" "FR" "RL" "RR"];
	    "target.object" = "alsa_output.pci-0000_c4_00.6.analog-surround-40";
	    "stream.dont-remix" = true;
	    "node.passive" = true;
	    "channelmix.upmix" = true;
	    "channelmix.upmix-method" = "simple";
	  };
	};
      }];
    };
  };

  environment.systemPackages = with pkgs; [ pavucontrol ];
}
