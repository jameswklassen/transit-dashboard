import React from "react"
import PropTypes from "prop-types"
import 'bootstrap/dist/css/bootstrap.min.css';

import { Nav, Navbar, NavDropdown } from 'react-bootstrap';

class Navigation extends React.Component {
  render () {
    return (
      <Navbar bg="light" expand="lg">
        <Navbar.Brand href="#home">Transit Dashboard</Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="mr-auto">
            <Nav.Link href="/">Home</Nav.Link>
            <Nav.Link href={this.props.newTransaction}>New Transaction</Nav.Link>
          </Nav>
          { this.props.signedIn ? this.signedIn() : this.signedOut() }
        </Navbar.Collapse>
      </Navbar>
    );
  }

  signedIn() {
    return(
      <Nav>
        <Nav.Link
          href={this.props.editUser}
        >
          Edit Profile
        </Nav.Link>
        <Nav.Link
          href={this.props.logout}
          data-method='delete'
        >
          Logout
        </Nav.Link>
      </Nav>
    );
  }

  signedOut() {
    return(
      <Nav>
        <Nav.Link
          href={this.props.login}
        >
          Login
        </Nav.Link>
        <Nav.Link
          href={this.props.signup}
        >
          Sign Up
        </Nav.Link>
      </Nav>
    )
  }
}

Navigation.propTypes = {
  newTransaction: PropTypes.string,
  currentUser: PropTypes.class,
  signedIn: PropTypes.boolean,
  editUser: PropTypes.string,
  logout: PropTypes.string,
  signup: PropTypes.string,
  login: PropTypes.string
};
export default Navigation
