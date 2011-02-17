# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nflqb_session',
  :secret      => '0203bea3b545d463256d8b9f93f8a2df9077532e24e9147becc5c496b78f871dd88576d24e9e32ab03bd8fb953bf445dc3fa5f9debea07c176bf20f6d7ab66b4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
