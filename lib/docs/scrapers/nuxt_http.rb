module Docs
  class NuxtHttp < UrlScraper
    self.name = '@nuxt/http'
    self.slug = 'nuxt_http'
    self.type = 'simple'
    self.links = {
      home: 'https://http.nuxtjs.org/',
      code: 'https://github.com/nuxt-community/http-module'
    }


    # options[:skip] = %w(migration.html glossary.html)
    # options[:replace_paths] = { 'guide/' => '/', 'api/' => 'api/index.html' }
    options[:max_image_size] = 1_000_000
    options[:attribution] = <<-HTML
      &copy; 2020&ndash;nuxt.js<br>
      Licensed under the MIT License.
    HTML

    self.release = '0.6.0'
    self.base_url = 'https://http.nuxtjs.org/'
    self.root_path = ''
    # self.initial_paths = ['/guide/setup.html', '/api']
    html_filters.push 'nuxt_http/entries', 'nuxt_http/clean_html'

    def get_latest_version(opts)
      get_latest_github_release('nuxt-community', 'auth-module', opts)
    end
  end
end
