{ config, ... }: 
let
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.walker = {
    enable = true;
    runAsService = true;

    theme = {
      layout = {
        ui = {
          anchors = {
            bottom = true;
            left = true;
            right = true;
            top = true;
          };

          window = {
            box = {
              h_align = "center";
              margins = {
                bottom = 200;
                top = 200;
              };
              orientation = "horizontal";
              scroll = {
                list = {
                  always_show = true;
                  item = {
                    activation_label = {
                      h_align = "end";
                      h_expand = true;
                      justify = "right";
                      x_align = 1;
                    };
                    icon = {
                      theme = "Papirus";
                    };
                    spacing = 5;
                    text = {
                      h_align = "fill";
                      h_expand = true;
                      revert = true;
                    };
                  };
                  max_height = 300;
                  max_width = 400;
                  min_width = 400;
                  width = 400;
                };
                overlay_scrolling = false;
              };
              search = {
                spacing = 10;
                v_align = "start";
                width = 400;
              };
              spacing = 10;
              v_align = "start";
            };
            h_align = "fill";
            v_align = "fill";
          };
        };
      };
      style = ''
            #window,
    #box,
    #search,
    #password,
    #input,
    #typeahead,
    #spinner,
    #list,
    child,
    scrollbar,
    slider,
    #item,
    #text,
    #label,
    #sub,
    #activationlabel {
      all: unset;
    }

    #window {
      background: none;
    }

    #box {
      background: ${colors.base00};
      padding: 16px;
      border-radius: 4px;
      border: 2px solid ${colors.base0C};
    }

    scrollbar {
      background: none;
      padding-left: 8px;
    }

    slider {
      min-width: 2px;
      background: #7f849c;
      opacity: 0.5;
    }

    #search {
    }

    #password,
    #input,
    #typeahead {
      background: #363a4f;
      background: none;
      box-shadow: none;
      border-radius: 0px;
      border-radius: 32px;
      color: #c6d0f5;
      padding-left: 12px;
      padding-right: 12px;
    }

    #input {
      background: none;
    }

    #input > *:first-child,
    #typeahead > *:first-child {
      color: #7f849c;
      margin-right: 7px;
    }

    #input > *:last-child,
    #typeahead > *:last-child {
      color: #7f849c;
    }

    #spinner {
    }

    #typeahead {
      color: #89b4fa;
    }

    #input placeholder {
      opacity: 0.5;
    }

    #list {
    }

    child {
      border-radius: 8px;
      color: #cad3f5;
      padding: 4px;
    }

    child:selected,
    child:hover {
      background: #414559;
      box-shadow: none;
      color: #cad3f5;
    }

    #item {
    }

    #icon {
    }

    #text {
    }

    #label {
      font-weight: bold;
      color: #cad3f5;
    }

    #sub {
      opacity: 0.5;
      color: #cad3f5;
    }

    #activationlabel {
      opacity: 0.5;
      padding-right: 4px;
    }

    .activation #activationlabel {
      font-weight: bold;
      color: #89b4fa;
      opacity: 1;
    }

    .activation #text,
    .activation #icon,
    .activation #search {
    }
      '';
    };
  };
}
