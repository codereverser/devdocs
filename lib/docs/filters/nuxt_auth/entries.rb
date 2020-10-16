module Docs
  class NuxtAuth
    class EntriesFilter < Docs::EntriesFilter
      def get_name
        name = at_css('.content__default > h1 > a').next_sibling.text.strip
        node = at_css("a.active.sidebar-link")
        return name if node.nil?

        parent_node = node.parent.parent.previous_element
        main_node = parent_node.parent.parent.parent

        index = node.parent.parent.css("a.sidebar-link").to_a.index(node)
        name.prepend "#{index + 1}. " if index
        name
      end

      def get_type
        if slug.start_with?("api") then
          "API"
        else
          node = at_css("a.sidebar-link.active")
          node.parent.parent.previous_element.css("span")[0].content.strip
        end
      end

      def additional_entries
        return []
      end
    end
  end
end
