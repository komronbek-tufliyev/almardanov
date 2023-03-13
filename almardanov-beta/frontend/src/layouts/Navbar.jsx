import Button from 'react-bootstrap/Button';
import Container from 'react-bootstrap/Container';
import Form from 'react-bootstrap/Form';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
// import NavDropdown from 'react-bootstrap/NavDropdown';
import { useState, useEffect } from 'react';
import axios from 'axios';

export default function Navigationbar() {

  const [search_term, setSearch_term] = useState('');
  const [search_result, setSearch_result] = useState([]);

  const base_url = 'http://127.0.0.1:8000/api/v1';

  const search = () => {
    console.log("search term");
    console.log(search_term);
    if (search_term === '') {
      return;
    }
    const search_url = `${base_url}/questions/${search_term}/`;
    axios.get(search_url).then((response) => {
      console.log(response.data);
      setSearch_result(response.data);
    }
    ).catch((error) => {
      console.log(error);
      setSearch_result([]);
    }
    )
  }

  useEffect(() => {
    console.log("search result");

  } , [search_result])


  const dark_search_style = {
    backgroundColor: '#343a40',
    borderColor: '#343a40',
    color: '#fff',
    placeholder: '#fff',
  }

  return (
    <Navbar bg="dark" variant='dark' expand="lg">
      <Container fluid>
        {/* <Navbar.Brand href="/">Beat it</Navbar.Brand> */}
        <Navbar.Toggle aria-controls="navbarScroll" />
        <Navbar.Collapse id="navbarScroll">
          <Nav

            className="me-auto my-2 my-lg-0 dark"
            // style={{ maxHeight: '100px' }}
            >
            <Nav.Link href="/" active>Home</Nav.Link>
            <Nav.Link href="/quizzes" >Quizzes</Nav.Link>
            <Nav.Link href="/questions" >Questions</Nav.Link>
            <Nav.Link href="/takequiz/1/" className='text-info'>Take a Quiz</Nav.Link>
            <Nav.Link href="/about">About</Nav.Link>
            {/* <NavDropdown title="Link" id="navbarScrollingDropdown" className='bg-dark dropdown-menu-dark' menuVariant="dark">
              <NavDropdown.Item href="#action3" >Action</NavDropdown.Item>
              <NavDropdown.Item href="#action4">
                Another action
              </NavDropdown.Item>
              <NavDropdown.Divider />
              <NavDropdown.Item href="#action5">
                Something else here
              </NavDropdown.Item>
            </NavDropdown> */}
            </Nav>
            <Form className="d-flex">
             <Form.Control
                type="search"
                placeholder="Search"
                className="me-2"
                aria-label="Search"
                style={dark_search_style}
                onChange={(e) => {console.log(e.target.value); setSearch_term(e.target.value)}}
             />
             <Button variant="outline-info" onClick={search}>Search</Button>
           </Form>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
}

