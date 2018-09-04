module FormToModel
  extend ActiveSupport::Concern

  def has_destroy_flag?(hash)
    ActiveRecord::Type::Boolean.new.cast(hash['_destroy'])
  end

  def new_record?
    id.blank?
  end

  def _destroy
    marked_for_destruction?
  end

  def marked_for_destruction?
    @marked_for_destruction
  end

  def mark_for_destruction
    @marked_for_destruction = true
  end

  module ClassMethods
    def has_many(name, options = {})
      raise ArgumentError, 'association names must be a Symbol' unless name.is_a?(Symbol)

      klass = extract_class_name(options)

      # This is a requirent in order to get fields_for working in the view.
      define_method "#{name}_attributes=" do |attributes|
        attributes.each do |_k, v|
          obj = klass.new(v)
          send(name) << obj unless has_destroy_flag?(v)
        end
      end
    end

    def extract_class_name(options)
      options[:class_name]&.constantize
    end
  end
end
