{ config, ... }: {

  networking = {
    hostName = "nixos";
    resolvconf.enable = false;
    networkmanager.enable = false;
    nameservers = [          # Cloudflare DNS Servers:
      "1.1.1.1"              # IPV4 Primary
      "1.0.0.1"              # IPV4 Secondary
      "2606:4700:4700::1111" # IPV6 Primary
      "2606:4700:4700::1001" # IPV6 Secondary
    ];
  };

  services = {
    connman = {
      enable = true;
      extraConfig = ''
	[Global]
	UseDefaultDNS=false
	EnableWifi=false
      '';
    };
    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        server_names = [ "cloudflare" ];
        ipv6_servers = true;
        require_dnssec = true;
        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        };
      };
    };
  };

}

