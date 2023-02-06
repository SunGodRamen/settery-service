Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000' # Change this to the domain name of your React app hosted on GCP
    resource '*', headers: :any, methods: [:get, :post, :options]
  end
end