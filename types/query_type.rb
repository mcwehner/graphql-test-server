QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :node do
    type NodeType
    argument :url, !types.String
    description 'Find a node by URL'
    resolve ->(obj, args, ctx) { Node.find(args['url']) }
  end

  field :nodes do
    type !types[NodeType]
    description 'Find all nodes'
    resolve ->(obj, args, ctx) { Node.all }
  end

  # field :graph do
  #   type !GraphType
  # end
end
