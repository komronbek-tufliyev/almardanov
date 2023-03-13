import {} from 'react-bootstrap';
import { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";


export default function TakeQuiz(props) {
    const [questions, setQuestions] = useState([]);
    const [answer, setAnswer] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(false);
    const { quiz_id } = useParams();

    var answers = [];

    const base_url = 'http://127.0.0.1:8000/api/v1';

    const fetchQuestions = async () => {
        try {
            setLoading(true);
            const response = await axios.get(`${base_url}/quizzes/${quiz_id}/questions/`);
            console.log(response.data);
            setLoading(false);
            setQuestions(response.data);
        } catch (error) {
            console.log(error);
            setError(true);
            setQuestions([]);
            setLoading(false);
        }
    }


    const send_answers = async () => {
        try {
            setLoading(true);
            const response = await axios.post(`${base_url}/quizzes/${quiz_id}/questions/`);
            console.log(response.data);
            setLoading(false);
            setAnswer(response.data);
        } catch (error) {
            console.log(error);
            setError(true);
            setAnswer([]);
            setLoading(false);
        }
    }


            

    useEffect(() => {
        

        
    }, [quiz_id]);

    return (
        <>
            <h1>Take Quiz</h1>
            <h2>{this.props.match.params.id}</h2>

        </>
    )


}

