import Button from 'react-bootstrap/Button';
import Container from 'react-bootstrap/Container';
import Form from 'react-bootstrap/Form';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import { Card, Modal } from 'react-bootstrap';
// import NavDropdown from 'react-bootstrap/NavDropdown';
import { useState, useEffect } from 'react';
import axios from 'axios';



export default function Navigationbar() {

  const [search_term, setSearch_term] = useState('');
  const [search_result, setSearch_result] = useState([]);
  const [error, setError] = useState(false);
  const [loading, setLoading] = useState(false);
  const [is_result_show, setIs_result_show] = useState(false);
  const [error_message, setErrorMessage] = useState('');



  const base_url = 'http://127.0.0.1:8000/api/v1';

  const search = () => {
    // console.log("search term");
    // console.log(search_term);
    if (search_term === '') {
      return;
    }
    const search_url = `${base_url}/questions/${search_term}/`;
    axios.get(search_url).then((response) => {
      if (response.status === 200) {
        // console.log(response.data);
        // console.log("success");
        setSearch_result(response.data);
        setIs_result_show(true);
        console.log(search_result, 'search result');
        // show_search_result();
      }else{
        // console.log("error");
        setErrorMessage(`No result found for given ${search_term} search term`);
        setIs_result_show(true);
        setSearch_result([]);
      }
      
    }
    ).catch((error) => {
      setIs_result_show(true);
      console.log(error);
      console.log("error");
      setSearch_result([]);
      setErrorMessage(`Something went wrong. Please try again later.`);
    }
    )
    // console.log(search_result, 'outside of axios');
    setIs_result_show(true);
  }


  useEffect(() => {
    // console.log("search result");

  }, [])


  const show_search_result = () => {
    // { search_result.data ? console.log(search_result): console.log('No result')}
    return (
      <Modal show={is_result_show} onHide={handleClose}
        keyboard={false} >
        <Modal.Header closeButton>
          <Modal.Title>Result</Modal.Title>
        </Modal.Header>
        <Modal.Body >
          {search_result.length ? search_result.map((question) => (
            <Card key={question.id} className='card mb-3'>
              <Card.Header key={question.quiz}><span className='fw-bold'>Quiz:</span> {question.quiz} </Card.Header>
              <Card.Body key={question.text}>Question: {question.text}</Card.Body>
              <Card.Footer key={question.id} className='text-primary text-end' as='a' href={'/takequiz/'+question.id}>Go to quiz </Card.Footer>
            </Card>
          )): <p className='text-danger'>{error_message}</p>}
          

        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Close
          </Button>
        </Modal.Footer>
      </Modal>
    )
  }

  const handleClose = () => {
    // setError(false);
    // change modal show to false
    setIs_result_show(false);
  }



  const dark_search_style = {
    backgroundColor: '#343a40',
    borderColor: '#343a40',
    color: '#fff',
    placeholder: '#fff',
  }

  return (
    <>
      <Navbar bg="dark" variant='dark' expand="lg">
        <Container fluid>
          <Navbar.Brand href="/">Beat it</Navbar.Brand>
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
            <Form className="d-flex" onKeyPress={(e) => { if (e.key === 'Enter') { e.preventDefault(); search(); show_search_result(); } }}
            >
              <Form.Control
                type="search"
                placeholder="Search"
                className="me-2"
                aria-label="Search"
                style={dark_search_style}
                onChange={(e) => { setSearch_term(e.target.value) }}
              />
              <Button
                variant="outline-info"
                onKeyPress={(e) => { e.key === 'Enter' && e.preventDefault(); }}
                onClick={(e) => { search(); show_search_result(); }}
              >
                Search
              </Button>
            </Form>
          </Navbar.Collapse>
        </Container>
      </Navbar>
      {is_result_show && show_search_result()}
    </>
  );
}

