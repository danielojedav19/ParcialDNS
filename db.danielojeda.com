$TTL 604800
@   IN  SOA servidor-maestro.danielojeda.com. admin.danielojeda.com. (
        1
        604800
        86400
        2419200
        604800 )

@       IN  NS      servidor-maestro.danielojeda.com.

servidor-maestro   IN  A     192.168.56.10
parcial            IN  A     192.168.56.10
www                IN  CNAME parcial
