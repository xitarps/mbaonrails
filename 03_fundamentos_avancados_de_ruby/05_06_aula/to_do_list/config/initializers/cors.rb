Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000',
            'http://127.0.0.1:3000',
            'http://127.0.0.1:8000' # in case we want to test from another pc
                                    # here serving a .html file that uses fetch to hit this api
                                    # using python3 -m http.server since ///file won't be allowed

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end