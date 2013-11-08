Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'IRZSU74sl9nF36ctTxFsFw', 'VDm8XAp9nHR48SbtTTO7VJNNTeUcNJW0rZA07UsxWfU'
  provider :github, 'ea3547e936665231526d', 'f855737730d26e762ccadf175df59f7abd56f23d'
end
