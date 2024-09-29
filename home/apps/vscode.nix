{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs; [ vscode-extensions.svelte.svelte-vscode ];
  };
}
