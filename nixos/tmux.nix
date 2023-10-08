{ config, pkgs, ... } :
{
    programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.
     set -g status-right '#[fg=black,bg=color15] #{cpu_percentage}  %H:%M '
     run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
  '';
  };
}

