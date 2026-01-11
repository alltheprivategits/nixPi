{ config, pkgs, lib, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = lib.concatStrings [ 
        "$os"
        "$directory"
        "$fill"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$git_metrics"
        "$nodejs"
        "$time $cmd_duration"
        "$line_break"
        "$character"
      ];

      fill = {
        symbol = " ";
      };

      os = {
        disabled = false;
        format = "[$symbol ](cyan)";
        symbols.Windows = " ";
        symbols.Ubuntu = " ";
        symbols.Fedora = " ";
        symbols.Arch = " ";
        #symbols.generic = " "
      };

      directory = {
        style = "cyan";
        truncate_to_repo = true;
      };

      character = {
        success_symbol = "[](cyan)";
        error_symbol = "[](red)";
        vicmd_symbol = "[](green)";
      };

      git_branch = {
        symbol = " ";
        format = "[$symbol$branch]($style) ";
        style = "bright-black";
      };

      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "cyan";
      };

      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)\) ";
        style = "bright-black";
      };

      git_metrics = {
        disabled = false;
      };

      cmd_duration = {
        format = "[$duration]($style)";
        style = "yellow";
      };

      time = {
        disabled = false;
        style = "purple";
        format = "[$time]($style)";
      };

      custom.stunnel = {
        when = "ps aux | grep stunnel | grep -v grep";
        command = "ps -o etime= -p $(ps aux | grep stunnel | grep -v grep | awk '{print $2}')";
        style = "red";
        format = "[TUNNEL OPEN for $output]($style)%";
      };

    };
  };
}
