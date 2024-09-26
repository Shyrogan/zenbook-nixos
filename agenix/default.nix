{ agenix, ...  }: {
  environment.systemPackages = [ agenix.packages.x86_64-linux.default ];
  age.secrets = {
    wifis.file = ../secrets/wifis;
  };
}
