{ inputs, ...  }: {
  imports = [
    inputs.agenix.nixosModules.default
  ];
  environment.systemPackages = [ inputs.agenix.packages.x86_64-linux.default ];
  age = {
    secrets = {
      wifis.file = ../../assets/secrets/wifis;
    };
    identityPaths = [ "/etc/ssh/id_ed25519" ];
  };
}
