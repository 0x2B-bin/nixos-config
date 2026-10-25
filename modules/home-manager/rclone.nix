{
  flake.homeModules.rclone = { lib, ...}:
  let
    hosts = ["yorha" "tailless" "oracle" "limbus" "nazuna" "eve"];
  in
  {
    programs.rclone = {
      enable = true;

      remotes = lib.genAttrs hosts (name: {
        config = {
          type = "sftp";
          host = name;
          key_file = "~/.ssh/keys/${name}";
          shell_type = "unix";
          md5sum_command = "md5sum";
          sha1sum_command = "sha1sum";
        };
      });
    };
  };
}
