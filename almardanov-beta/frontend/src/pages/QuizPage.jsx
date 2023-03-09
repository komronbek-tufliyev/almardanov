import { Container, ListGroup, ListGroupItem, FormSelect } from "react-bootstrap";
import {Form} from 'react-bootstrap';
import { useState, useEffect } from "react";
import axios from "axios";


// import Link

export default function QuizPage(){
    const [quizzes, setQuiz] = useState([]);
    const [categories, setCategory] = useState([]);
    const [category, setOneCategory] = useState('');
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(true);
    const [page, setPage] = useState(1);

    const base_url = 'http://127.0.0.1:8000/api/v1';

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
            const response = await axios.get(`${base_url}/quizzes/${category_name}`);
            console.log("Resp", response.data);
            
        } catch (error) {
            setError(true);
            setQuiz([]);
        }
    }


    function handleCategoryChange(event){
        console.log('event target value', event.target.value);
        setOneCategory(event.target.value);
        get_quizes_by_catergory(category);
        
    }

    useEffect(() => {
        fetchQuiz();
        fetchCategory();
    }
    , []);

    return (
        <Container className="mt-5">
            <h1 className="text-center mb-3">Quizzes</h1>
            
                {/* <ListGroupItem key={c.id}>
                </ListGroupItem> */}
            <Form.Select onChange={(event)=>{handleCategoryChange(event)}}>
        
                {categories.map(c => (
                    <option key={c.id} >{c.name}</option>
                ))}

            </Form.Select>
            <br />    
            {category}
            
            <ListGroup>
                <h4 className="text-info fw-normal">Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat, aspernatur.</h4>
            {quizzes.map(q => (
                <ListGroupItem key={q.id}>
                            {q.name}
                    </ListGroupItem>
                ))}
            </ListGroup>
        </Container>                
    )
}

