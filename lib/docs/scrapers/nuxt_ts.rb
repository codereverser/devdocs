module Docs
    class NuxtTs < UrlScraper
      self.name = '@nuxt/typescript'
      self.slug = 'nuxt_ts'
      self.type = 'simple'
      self.links = {
        home: 'https://typescript.nuxtjs.org/',
        code: 'https://github.com/nuxt/typescript'
      }
  
  
      options[:only_patterns] = [/^guide\//, /^cookbook\//]
      options[:replace_paths] = { 'guide/' => 'guide/index.html' }
      # options[:skip] = %w(/examples)
      options[:max_image_size] = 1_000_000
      options[:attribution] = <<-HTML
        &copy; 2020&ndash;nuxt.js<br>
        Licensed under the MIT License.
      HTML
  
      self.release = '2.0.0'
      self.base_url = 'https://typescript.nuxtjs.org/'
      self.root_path = 'guide/index.html'
      # self.initial_paths = ["/guide/index.html"]
      html_filters.push 'nuxt_auth/entries', 'nuxt_auth/clean_html'
  
      def get_latest_version(opts)
        get_latest_github_release('nuxt', 'typescript', opts)
      end
    end
  end
  