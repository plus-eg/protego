use Mix.Config

config :guardian, Guardian,
allowed_algos: ["HS512"],
verify_module: Guardian.JWT,
issuer: "Protego",
ttl: { 30, :days },
verify_issuer: true,
secret_key: "secret_key",
serializer: Protego.GuardianSerializer

