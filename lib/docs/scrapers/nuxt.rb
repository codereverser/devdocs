module Docs
    class Nuxt < UrlScraper
      self.name = 'Nuxt.js'
      self.slug = 'nuxt'
      self.type = 'nuxt'
      self.links = {
        home: 'https://nuxtjs.org/',
        code: 'https://github.com/nuxt/nuxt.js/'
      }
  
  
      options[:only_patterns] = [/guides\//]
      options[:max_image_size] = 1_000_000
      options[:attribution] = <<-HTML
        &copy; 2020&ndash;nuxt.js<br>
        Licensed under the MIT License.
      HTML
  
      self.release = '2.14.7'
      self.base_url = 'https://nuxtjs.org/'
      self.root_path = 'guides/get-started/installation'
      html_filters.push 'nuxt/entries', 'nuxt/clean_html'
  
      def get_latest_version(opts)
        get_latest_github_release('nuxt', 'nuxt.js', opts)
      end
    end
  end
  