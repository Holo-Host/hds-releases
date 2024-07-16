# this file is autogenerated by .github/workflows/build-hds.yml
{
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/nixos/nixpkgs/archive/a3c8d64ba846725f040582b2d3b875466d2115bd.tar.gz";
    sha256 = "1hvm1iywlgsk49qall7vizf8w9hbl1ygbshlsly7lc8m5yg8awpm";
  };

  rust-overlay = builtins.fetchTarball {
    url = "https://github.com/oxalica/rust-overlay/archive/419e7fae2731f41dd9b3e34dfe8802be68558b92.tar.gz";
    sha256 = "03l7vgzm7djn7k8wsdfy3rh44al5ga459ix9vcxfgfdw0kpvf6z9";
  };
  rust-version = "1.78.0";

  x86_64-linux.holo-dev-server-bin = builtins.fetchTarball {
    url = "https://github.com/Holo-Host/hds-releases/releases/download/2024-07-16-220445/holo-dev-server-x86_64-linux.tar.gz";
    sha256 = "0imx6yx7qngfiynwq3lfb7pa17l097qfgaf359v8z3bi32baidq4";
  };
  aarch64-linux.holo-dev-server-bin = builtins.fetchTarball {
    url = "https://github.com/Holo-Host/hds-releases/releases/download/2024-07-16-220445/holo-dev-server-aarch64-linux.tar.gz";
    sha256 = "1y66bwx6pjvqb35ndxf8940hc5kz55a8b3pjn9zds2pw5zq2gzv5";
  };
  aarch64-darwin.holo-dev-server-bin = builtins.fetchTarball {
    url = "https://github.com/Holo-Host/hds-releases/releases/download/2024-07-16-220445/holo-dev-server-aarch64-darwin.tar.gz";
    sha256 = "";
  };
}
