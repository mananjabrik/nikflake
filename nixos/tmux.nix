{ config, pkgs, ... } :
{
    programs.tmux = {
    enable = true;
    clock24 = true;
	plugins = with pkgs.tmuxPlugins; [
      catppuccin
      sensible
      resurrect
    ];
    extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.
     run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
     
     set -g status-right '#[fg=black,bg=color15] #{cpu_percentage}  %H:%M '
     set-option -g default-shell ''${SHELL}
  '';
  };
}

