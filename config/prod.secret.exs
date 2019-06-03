# in this file, we load production configuration and
# secrets from environment variables. you can also
# hardcode secrets, although such is generally not
# recommended and you have to remember to add this
# file to your .gitignore.
use Mix.Config

config :wellies, api_key: System.get_env("WELLIES_API_KEY")
