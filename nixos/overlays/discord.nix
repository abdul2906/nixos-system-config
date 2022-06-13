self: super: {
  discord = super.discord.overrideAttrs (
    _: {
      src = builtins.fetchTarball "https://discord.com/api/download/stable?platform=linux&format=tar.gz";
    }
  );
}
