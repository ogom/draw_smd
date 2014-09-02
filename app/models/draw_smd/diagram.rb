module DrawSmd
  class Diagram
    class << self
      def schemas
        schemas = ActiveRecord::Base.connection.tables
        schemas.delete('schema_migrations')
        schemas.map! {|schema| schema.singularize.camelize}
        schemas = schemas.inject([]) { |arr, schema|
          arr << schema if state_machines?(schema)
          arr
        }
        schemas.sort
      end

      def state_machines?(schema)
        Object.const_get(schema).respond_to?(:state_machines)
      rescue
        false
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
