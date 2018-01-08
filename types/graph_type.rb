GraphType = GraphQL::ObjectType.define do
  name 'Graph'

  field :nodes, !types[!types.String]
end
