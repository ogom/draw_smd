module DrawSmd
  class Diagram
    class << self
      def schemas
        schemas = ActiveRecord::Base.connection.tables
        schemas.delete('schema_migrations')
        schemas.map! {|schema| schema.singularize.camelize}
        schemas.each do |schema|
          schemas.delete(schema) unless Object.const_get(schema).respond_to?(:state_machines)
        end
        schemas.sort
      end
    end

    def initialize(path)
      @path = File.expand_path(path, Rails.root)
      FileUtils.mkdir_p(@path)
    end

    def create(title, domain)
      options = {
        path: @path,
        name: title
      }

      Rails.application.eager_load!
      StateMachine::Machine.draw(domain, options)
    rescue => e
      Rails.logger.error(e)
    end
  end
end
