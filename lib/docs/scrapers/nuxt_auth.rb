module Docs
    class NuxtAuth < UrlScraper
      self.name = 'Nuxt.js Auth'
      self.slug = 'nuxt_auth'
      self.type = 'simple'
      self.links = {
        home: 'https://auth.nuxtjs.org/',
        code: 'https://github.com/nuxt-community/auth-module'
      }
  
  
      options[:skip] = %w(migration.html glossary.html)
      # options[:replace_paths] = { 'guide/' => '/', 'api/' => 'api/index.html' }
      options[:max_image_size] = 1_000_000
      options[:attribution] = <<-HTML
        &copy; 2020&ndash;nuxt.js<br>
        Licensed under the MIT License.
      HTML
  
      self.release = '4.9.1'
      self.base_url = 'https://auth.nuxtjs.org/'
      self.root_path = ''
      # self.initial_paths = ['/guide/setup.html', '/api']
      html_filters.push 'nuxt_auth/entries', 'nuxt_auth/clean_html'
  
      def get_latest_version(opts)
        get_latest_github_release('nuxt-community', 'auth-module', opts)
      end
    end
  end
  