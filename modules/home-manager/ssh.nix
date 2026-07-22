{
  flake.homeModules.ssh-config =
    { osConfig, ... }:
    {
      config = {
        home.file.".ssh/config".text = ''
          Host github.com
            User git
            IdentityFile ~/.ssh/keys/github_rsa

          Host gitlab.com
            User git
            IdentityFile ~/.ssh/keys/gitlab_rsa

          Host codeberg.org
            User git
            IdentityFile ~/.ssh/keys/codeberg

          Host acheron
            User ${osConfig.settings.username}
            IdentityFile ~/.ssh/keys/acheron_id_rsa
            Port 6060

          Host yorha
            User ${osConfig.settings.username}

          Host oracle
            User ${osConfig.settings.username}

          Host tailless
            User ${osConfig.settings.username}

          Host nazuna
            User ${osConfig.settings.username}
        '';
      };
    };
}
