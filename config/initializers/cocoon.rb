Cocoon::ViewHelpers.module_eval do
  def create_object(f, association, force_non_association_create=false)
    klass = f.object.class
    assoc = klass.respond_to?(:reflect_on_association) ? klass.reflect_on_association(association) : nil

    assoc ? create_object_on_association(f, association, assoc, force_non_association_create) : create_object_on_non_association(f, association)
  end
end
