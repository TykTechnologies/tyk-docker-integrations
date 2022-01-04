const { ApolloServer, gql } = require('apollo-server')

const typeDefs = gql`
  type Category {
    id: ID!
    name: String!
  }

  type Post {
    category: Category!
    content: String!
    title: String!
  }

  input PostInput {
    category: String!
    content: String!
    title: String!
  }

  type Mutation {
    createPost(input: PostInput!): Post
  }

  type Query {
    getPost(title: String!): Post
  }
`

const resolvers = {
  Mutation: {
    createPost: async (parent, { input }) => ({
      title: input.title,
      category: input.category,
      content: input.content,
    })
  },
}

const server = new ApolloServer({
  typeDefs,
  resolvers,
})

server.listen(4000).then(({ url }) => console.log(`Server running at ${url}`))
