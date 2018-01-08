MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :addNode, NodeType do
    description 'Adds a node'

    argument :url, !types.String

    resolve ->(obj, args, ctx) { Node.create(args.to_h) }
  end
end
