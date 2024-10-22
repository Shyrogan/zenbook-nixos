{
  # Some games provide an AppImage, this configuration allows to run them
  # directly from the file manager.
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
