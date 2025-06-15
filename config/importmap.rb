# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin '@popperjs/core', to: 'popper.js', preload: true
pin "@stimulus-components/sortable", to: "@stimulus-components--sortable.js" # @5.0.2
pin "@rails/request.js", to: "@rails--request.js.js" # @0.0.12
pin "sortablejs" # @1.15.6
