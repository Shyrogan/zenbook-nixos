{ pkgs, ... }: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_6_10;
    kernelPatches = [
      # This patches causes some error when running...
      #{
      #  name = "amd-pstate: Add missing documentation for `amd_pstate_prefcore_ranking`";
      #  patch = ./patches/amd_pstate.patch;
      #}
      {
        name = "Bluetooth: btusb: Add USB HW ID for ASUS Zenbook S 16";
        patch = ../../host/zenbook-s16/patches/bluetooth.patch;
      }
      {
        name = "asus-wmi: Disable OOBE experience on Zenbook S 16";
        patch = ../../host/zenbook-s16/patches/keyboard.patch;
      }
      {
        name = "accel/amdxdna: Add a new driver for AMD AI Engine";
        patch = ../../host/zenbook-s16/patches/npu.patch;
      }
      {
        name = "ASoC: amd: acp: add ZSC control register programming sequence";
        patch = ../../host/zenbook-s16/patches/zsc_control.patch;
      }
    ];
  };

}
