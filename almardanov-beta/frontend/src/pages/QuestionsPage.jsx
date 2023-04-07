import { useState, useEffect } from 'react';
import axios from 'axios';

import { Card, Container, Row, Col } from 'react-bootstrap';

import RightArrowIcon from '../static/icons/right-arrow-x16.png';

export default function QuestionsPage() {

    const [quiz, setQuiz] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(false);
    const [page, setPage] = useState(1);

    // const base_url = 'http://127.0.0.1:8000/api/v1/quizzes/';
    const base_url = 'http://almardanov.herokuapp.com/api/v1/quizzes/';

    console.log("QuestionsPage");
    const fetchQuiz = async () => {
        try {
            setLoading(true);
            const response = await axios.get(base_url);
            console.log(response.data.results);
            setLoading(false);
            setQuiz(response.data.results);
        } catch (error) {
            console.log(error);
            setError(true);
            setQuiz([]);
            setLoading(false);
        }
    }

    console.log(quiz);

    useEffect(() => {
        fetchQuiz();
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
                    {quiz && quiz.map(q => (
                        <Col key={q.id} md={4} className='col-md-6 mb-4'>
                            <Card>
                                <Card.Header><b>Category:</b> {q.category}</Card.Header>
                                <Card.Body className='d-flex justify-content-between'>
                                    <div><b>Quiz:</b> {q.name}</div>
                                    <a href={`/takequiz/${q.id}`}>
                                        <img src={RightArrowIcon} alt="" />
                                    </a>

                                </Card.Body>

                            </Card>
                        </Col>
                    ))}
                </Row>
            </Container>
        </>
    )
}


