# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_checkers_session',
  :secret      => '023d397f955c63252d4861cddb12863ffe938170642dbfa3c3b3671a0558a8aef8f2f5cdd46db19d4e35979dfa95b251a505686df91822a504be5871b12bb09e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
