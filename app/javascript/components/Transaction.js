import React from "react"
import PropTypes from "prop-types"
import 'bootstrap/dist/css/bootstrap.min.css';

import { Button, Card } from 'react-bootstrap';

class Transaction extends React.Component {
  render () {
    return (
      <Card>
        <Card.Body>
          <h2>{ this.props.transaction.location }</h2>
          <p>{ this.props.transaction.date }</p>
          <Button
            href={this.props.link}
            variant="light"
          >
            View details
          </Button>
          { this.transactionFields() }
        </Card.Body>
      </Card>
    );
  }
  transactionFields () {
    return Object.keys(this.props.transaction).map(key => {
      return(
        <p>
          <b>{ key }: </b>
          { this.props.transaction[key] }
        </p>
      )
    });
  };
}

Transaction.propTypes = {
  transaction: PropTypes.class
};
export default Transaction
