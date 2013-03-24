module RadiantCells
  module Tags
    include Radiant::Taggable
    
    %{ Allows a cell view to be added to a radiant snippet or layout }
    tag "cell" do |tag|
     if tag.attr['name'] && tag.attr['view']
       name, view = tag.attr.delete('name'), tag.attr.delete('view')
       tag.locals.page.response.template.controller.render_cell(name, view, tag.attr)
     else
       raise TagError.new("`cell' tag must contain `name' and `view' attributes")
     end
    end
    
    desc %{
      Renders a Rails Partial
      
      *Usage:*
       <pre><code><r:render_partial name="path/to/partial" /></code></pre>
    }
    tag 'render_partial' do |tag|
      if tag.attr['name']
        name = tag.attr.delete('name')
        # TODO: Allow locals to be passed in
        response.template.render :partial => name, :locals => {}
      else
        raise TagError.new("`render_partial' tag must contain a `name` attribute")
      end
    end
    
    desc %{
      renders the content of a file system file to the page

      *Usage:*
       <pre><code><r:include file="/xyz.html" /></code></pre>
    }
    tag 'include' do |tag|
      raise TagError, "`include' tag must contain a file attribute." unless tag.attr["file"]
      options = tag.attr.dup
      v = options['file']
      IO.read(File.join(RAILS_ROOT, 'public', v))
    end
    
  end
end