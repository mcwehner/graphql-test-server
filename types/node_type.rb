NodeType = GraphQL::ObjectType.define do
  name 'Node'

  field :url, !types.String
end
