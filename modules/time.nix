let
  timeServers = [
    "ohio.time.system76.com"
    "oregon.time.system76.com"
    "virginia.time.system76.com"
    "stratum1.time.cifelli.xyz"
    "time.cifelli.xyz"
    "time.txryan.com"
  ];
in
  {lib, ...}: {
    flake.modules.nixos.base = {
      services.automatic-timezoned.enable = true;
      # https://github.com/NixOS/nixpkgs/issues/68489#issuecomment-1484030107
      services.geoclue2.enableDemoAgent = lib.mkForce true;

      services.chrony = {
        enable = true;
        enableNTS = true;
        #enableRTCTrimming = config.hostSpec.hasRtc;
        servers = timeServers;
        serverOption = "iburst";
        #extraFlags = lib.optional (! config.hostSpec.hasRtc) "-s";
        extraConfig = ''
          port 0
          cmdport 0
          hwtimestamp *
        '';
      };

      networking.timeServers = timeServers;
      networking.hosts = {
        "3.134.129.152" = ["ohio.time.system76.com"];
        "52.10.183.132" = ["oregon.time.system76.com"];
        "3.220.42.39" = ["virginia.time.system76.com"];
        "143.42.132.139" = ["stratum1.time.cifelli.xyz"];
        "50.116.42.84" = ["time.cifelli.xyz"];
        "15.204.249.252" = ["time.txryan.com"];
      };
    };
  }
