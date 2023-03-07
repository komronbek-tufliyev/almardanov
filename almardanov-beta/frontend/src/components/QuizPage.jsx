// import {Link} from 'react-router-dom';
import { useState, useEffect } from 'react';
import axios from 'axios';

import { Button, Card, Container, Row, Col, Pagination } from 'react-bootstrap';
// import Paginate from './Pagination';
// import {ProgressBar} from 'react-bootstrap';
// import { Pagination } from 'react-bootstrap';
export default function QuizPage() {

    const [quiz, setQuiz] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(false);
    const [page, setPage] = useState(1);

    // const fetchQuiz = async () => {
    //     try {
    //         setLoading(true);
    //         const response = await axios.get('http://127.0.0.1:8000/api/v1/quizzes/');
    //         // set page
    //         // setPage(response.data.page);
    //         setLoading(false);
    //         return response.data;
    //     } catch (error) {
    //         setError(true);
    //         setQuiz([]);
    //         console.log(error);
    //         setLoading(false);
    //     }
    // }
    
    console.log(quiz);

    useEffect(() => {
            
        axios.get('http://127.0.0.1:8000/api/v1/quizzes/').then(response => {
            setQuiz(response.data.results);
            console.log(response.data.results);
        }).catch(error => {
            console.log(error);
        })
        
        // const data = fetchQuiz();
        // setQuiz(data.results);
    }, []);


    
    

    return (
        <>
            <Container className="mt-5">
        <Row>
          <Col>
            <h1>Welcome to my React app!</h1>
            <p>This is a simple homepage without a Navbar using React Bootstrap.</p>
          </Col>
        </Row>
        <Row className="mt-5">
            {loading && <p>Loading...</p>}
            {error && <p>Something went wrong!</p>}
            {/* if */}
            {quiz.map(q => (
                <Col key={q.id} md={4}>
                    <Card>
                        <Card.Header><b>Category:</b> {q.category}</Card.Header>
                        <Card.Body><b>Quiz:</b> {q.name}</Card.Body>
                    </Card>
                </Col>
            ))}
        </Row>
      </Container>
    </>
    )
}