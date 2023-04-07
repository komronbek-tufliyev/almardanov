import { Container, ListGroup, ListGroupItem, Row, Col } from "react-bootstrap";
import { Form } from 'react-bootstrap';
import { useState, useEffect } from "react";
import axios from "axios";


// import Link

export default function QuizPage(){
    const [quizzes, setQuiz] = useState([]);
    const [categories, setCategory] = useState([]);
    const [category, setOneCategory] = useState();
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(false);
    const [page, setPage] = useState(1);

    // const base_url = 'http://127.0.0.1:8000/api/v1';
    const base_url = 'https://almardanov.herokuapp.com/api/v1';

    const fetchQuiz = async () => {
        try {
            setLoading(true);
            const response = await axios.get(`${base_url}/quizzes/`);
            // setPage(response.data.page);
            setLoading(false);
            setQuiz(response.data.results);
        } catch (error) {
            setError(true);
            setQuiz([]);
            // console.log(error);
            setLoading(false);
        }
    }

    const fetchCategory = async () => {
        try {
            setLoading(true);
            const response = await axios.get(`${base_url}/categories/`);
            // setPage(response.data.page);
            setLoading(false);
            setCategory(response.data.results);
        } catch (error) {
            setError(true);
            setCategory([]);
            // console.log(error);
            setLoading(false);
        }
    }

    const get_quizes_by_catergory = async (category_name) => {
        try {
            console.log("req category", category_name);
            const response = await axios.get(`${base_url}/quizzes/by-category/${category_name}/`);
            console.log("res", response);
            console.log("Resp data", response.data.length);
            console.log(response.data);
            if (response.data.length > 0 ){
                setQuiz(response.data);
                console.log("No results");
            }
            else{
                setQuiz([]);
            }
            
        } catch (error) {
            setError(true);
            setQuiz([]);
        }
    }


    function handleCategoryChange(event){
        console.log('event target value', event.target.value);
        setOneCategory(event.target.value);
        get_quizes_by_catergory(event.target.value);
        
    }

    useEffect(() => {
        fetchQuiz();
        fetchCategory();
    }
    , []);

    return (
        <Container className="mt-5">
            <h1 className="text-center mb-3">Quizzes</h1>
            {loading && <p>Loading...</p>}
            {error && <p>Something went wrong!</p>}
                {/* <ListGroupItem key={c.id}>
                </ListGroupItem> */}
            <Form.Select onChange={(event)=>{handleCategoryChange(event)}} title="Category options">
                {categories && 
                    categories.map(c => (
                        <option key={c.id} value={c.name}>{c.name}</option>
                    )) 
                }
                

            </Form.Select>
            <br />    
            {category}
            
            <ListGroup>
                <h4 className="text-info fw-normal">Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat, aspernatur.</h4>
            {quizzes.length > 0 ? quizzes.map(q => (
                <ListGroupItem key={q.id}>
                            <Row className="mx-auto">
                                <Col>
                                    {q.name}
                                </Col>
                                <Col className="text-end">
                                    <a href={'/takequiz/'+q.id}>Go to quiz</a>
                                </Col>
                            </Row>
                    </ListGroupItem>
                )) : <p>No quizzes found</p>
            }
            </ListGroup>
        </Container>                
    )
}

