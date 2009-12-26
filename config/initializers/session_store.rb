# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_yamei_session',
  :secret      => '84519bb9ed859529c7429fcbe09611df636ccd66d7dd10c546a556a013191c2c67a8dddf92ffa80d12221ba07a57bc3ba54195178ad790155bc1a752f7a98cc9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
