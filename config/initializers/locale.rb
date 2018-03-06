# Load all locales path
Rails.application.config.i18n.default_locale = 'pt-BR'
Rails.application.config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.yml').to_s]
