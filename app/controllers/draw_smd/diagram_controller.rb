module DrawSmd
  class DiagramController < ::DrawSmd::ApplicationController
    def index
      @schemas = DrawSmd::Diagram.schemas

      title = 'smd'
      path = 'draw-smd'
      @image_file = File.join(path, "#{title}.png")

      @schema = ''
      @schema = params['schema'] if params.key?('schema')
      @schema = params['check']['schema'] if params.key?('check')

      diagram = DrawSmd::Diagram.new(File.join('public', 'images', path))
      diagram.create(title, @schema)
    end
  end
end
