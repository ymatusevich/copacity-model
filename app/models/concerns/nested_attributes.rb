module NestedAttributes
  def nested_attributes_for(*names)
    names.each do |name|
      define_method "#{name}_attributes" do
        return {} if send(name).blank?

        param =
            send(name).inject({}) do |memo, r|
              memo[r.id.to_s] = r.attributes
              memo
            end

        { "#{name}_attributes" => param }
      end
    end
  end
end
