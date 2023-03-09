import Button from 'react-bootstrap/Button';
import Container from 'react-bootstrap/Container';
import Form from 'react-bootstrap/Form';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import NavDropdown from 'react-bootstrap/NavDropdown';
import { Link } from 'react-router-dom';

function Navigationbar() {
  return (
    <Navbar bg="dark" variant='dark' expand="lg">
      <Container fluid>
        <Navbar.Brand href="#">Navbar scroll</Navbar.Brand>
        <Navbar.Toggle aria-controls="navbarScroll" />
        <Navbar.Collapse id="navbarScroll">
          <Nav
            className="me-auto my-2 my-lg-0 dark"
            style={{ maxHeight: '100px' }}
            
            navbarScroll
          >
            <Nav.Link href="/">Home</Nav.Link>
            <Nav.Link href="/about">About</Nav.Link>
            <NavDropdown title="Link" id="navbarScrollingDropdown" className='bg-dark' >
              <NavDropdown.Item href="#action3" >Action</NavDropdown.Item>
              <NavDropdown.Item href="#action4">
                Another action
              </NavDropdown.Item>
              <NavDropdown.Divider />
              <NavDropdown.Item href="#action5">
                Something else here
              </NavDropdown.Item>
            </NavDropdown>
            <Nav.Link href="#" disabled>
              Link
            </Nav.Link>
          </Nav>
          <Form className="d-flex">
            <Form.Control
              type="search"
              placeholder="Search"
              className="me-2"
              aria-label="Search"
            />
            <Button variant="outline-success">Search</Button>
          </Form>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
}


// import React, { Component } from 'react';
// import { Link } from 'react-router-dom';

// export default class Navbar extends Component {
//   render() {
//     return (
//       <div>
//         <nav className="navbar navbar-dark bg-dark navbar-expand-lg">
//           <Link to="/" className="navbar-brand">
//             Exercise Tracker
//           </Link>
//           <div className="collapse navbar-collapse">
//             <ul className="navbar-nav mr-auto">
//               <li className="navbar-item">
//                 <Link to="/" className="nav-link">
//                   Exercises
//                 </Link>
//               </li>
//               <li className="navbar-item">
//                 <Link to="/create" className="nav-link">
//                   Create Exercise Log
//                 </Link>
//               </li>
//               <li className="navbar-item">
//                 <Link to="/user" className="nav-link">
//                   Create User
//                 </Link>
//               </li>
//             </ul>
//           </div>
//         </nav>
//       </div>
//     );
//   }
// }



export default Navigationbar;