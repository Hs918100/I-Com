Sentry.init do |config|
  config.dsn = 'https://e6de3ea845dc69d2f89f57aa9ee55eaf@o4509011547127808.ingest.de.sentry.io/4509011631472720'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  config.traces_sample_rate = 1.0
  # Add data like request headers and IP for users,
  # see https://docs.sentry.io/platforms/ruby/data-management/data-collected/ for more info
  config.send_default_pii = true
  config.debug = true
end