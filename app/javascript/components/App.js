import React from 'react'
import gql from 'graphql-tag'
import { Query } from 'react-apollo'

const testField = gql`
{
  testField(name: "teste")
}
`

export default props => (
  <Query query={testField}>
    {
      ({ loading, error, data }) => {
        if (loading) return 'Loading...'
        if (error) return 'Error fetching!'

        return (
          <div>Result: {data.testField}</div>
        )
      }
    }
  </Query>
)
