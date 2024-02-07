{
  outputs = { self }:
    let
      nameValuePair = name: value: { inherit name value; };

      genAttrs = names: f:
        builtins.listToAttrs (map (n: nameValuePair n (f n)) names);

      srcs = import ./sources.nix;

      forEachSystem = genAttrs [
        "aarch64-linux"
        "x86_64-linux"
      ];

      # We only run tests for x86_64-linux in CI
      forEachTestSystem = genAttrs [
        "x86_64-linux"
      ];
    in
    {
      packages = forEachSystem (system:
        let
          pkgs = import srcs.nixpkgs { inherit system; };
          inherit (pkgs) lib;
        in
        {
          holo-dev-server-bin =
            let
              src = srcs.${system}.holo-dev-server-bin;
            in
            pkgs.runCommand "holo-dev-server-bin"
              {
                # holo-dev-server.deps.json contains the build-time dependencies of
                # the original holo-dev-server binary.
                # Nix detects runtime dependencies by scanning for the out path
                # hashes of the build-time inputs.
                # NOTE: these dependencies are not vendored! So users need to be
                # able to either build or substitute them.
                buildInputs = map
                  (inputAttr: pkgs.${inputAttr})
                  (lib.importJSON ./holo-dev-server.deps.json);
              }
              ''
                mkdir -p $out/bin
                cp -a ${src}/bin/holo-dev-server $out/bin/holo-dev-server
              '';
        });

      checks = forEachTestSystem (system: {
        holo-dev-server-bin = self.packages.${system}.holo-dev-server-bin;
      });
    };
}
